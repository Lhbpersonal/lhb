package ex;//实验三代码、实验四客户端

import java.awt.BorderLayout;
import java.awt.EventQueue;
import java.net.Socket;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import java.util.Scanner;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.JScrollPane;
import javax.swing.JButton;
import javax.swing.JTable;
import javax.swing.SwingWorker;
import javax.swing.table.DefaultTableModel;

import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

public class Ex3 extends JFrame {

	private JPanel contentPane;
	private JTable table;
	private DefaultTableModel defaultTableModel;
	private ReceiveAndProcessData receiveAndProcessData;
	Hashtable<String, airPlane> hashtable = new Hashtable<>(); 
	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					Ex3 frame = new Ex3();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		);
	}

	/**
	 * Create the frame.
	 */
	public Ex3() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 548, 356);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		contentPane.setLayout(new BorderLayout(0, 0));
		setContentPane(contentPane);
		
		JPanel panel = new JPanel();
		contentPane.add(panel, BorderLayout.NORTH);
		
		JButton button = new JButton("启动");
		button.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) { 
				   receiveAndProcessData = new ReceiveAndProcessData(hashtable);
				   receiveAndProcessData.execute();
			}
		});
		panel.add(button);
		table = new JTable();
		defaultTableModel=new DefaultTableModel(
				new Object[][] {
				},
				new String[] {
						"航班号", "共享航班","经停站","目的站","办票时间","值机柜台","登机口","航班状态"
				}
			);
		
		table.setModel(defaultTableModel);
		JScrollPane scrollPane = new JScrollPane(table);
		contentPane.add(scrollPane, BorderLayout.CENTER);
		
	}
	class ReceiveAndProcessData extends SwingWorker<String, ArrayList<airPlane>> {
        Hashtable<String, airPlane> displayDataVecotr;
        public ReceiveAndProcessData(Hashtable<String,airPlane> displayDataVecotr) {
			// TODO 自动生成的构造函数存根{
			this.displayDataVecotr = displayDataVecotr;
		}
		@Override
		protected String doInBackground() throws Exception {
			String line="";

			try(Socket socket=new Socket("10.5.182.203",7);
					Scanner scanner=new Scanner(socket.getInputStream())){	
			System.out.println("服务器连接成功！！！");
			while(!(line = scanner.nextLine()).equals("no data!"))
			{
				String ch = "";
				String flno = "";
				String ckno = "";
				String[] tt = null;
				//航班标识
				Pattern p1 = Pattern.compile("(?<=ffid=).*?(?=\\,)");
				Matcher m1 = p1.matcher(line);
				if(m1.find())
				{
					tt = m1.group().split("-");
					ch = tt[3];
				}
				if(ch.equals("D"))
				{
					flno = tt[0]+tt[1];
					airPlane Fight = new airPlane();
					Fight.planeflno = flno;
					//共享航班号
					Pattern p2 = Pattern.compile("(?<=sfno=).*?(?=\\,)");
					Matcher m2 = p2.matcher(line);
					if(m2.find())
					{
						if(!m2.group().equals("null"))
							Fight.planesfno = m2.group();
					}
					//经停
					Pattern p4 = Pattern.compile("(?<=arno=2, apcd=).*?(?=\\,)");
					Matcher m4 = p4.matcher(line);
					if(m4.find())
					{
						if(!m4.group().equals("null"))
							Fight.planearno2 = m4.group();
					}
					//目的
					Pattern p5 = Pattern.compile("(?<=arno=3, apcd=).*?(?=\\,)");
					Matcher m5 = p5.matcher(line);
					if(m5.find())
					{
						if(!m5.group().equals("null"))
							Fight.planearno3 = m5.group();
					}
					//办票时间
					Pattern p6 = Pattern.compile("(?<=fett=).*?(?=\\,)");
					Matcher m6 = p6.matcher(line);
					if(m6.find())
					{
						if(!m6.group().equals("null"))
							Fight.planefett = m6.group();
					}
					//柜台
					Pattern p7_ckno = Pattern.compile("(?<=ckno=).*?(?=\\])");
					Matcher m7_ckno = p7_ckno.matcher(line);
					while(m7_ckno.find())
					{
						Pattern p7_code = Pattern.compile("(?<=code=).*?(?=\\,)");
						Matcher m7_code = p7_code.matcher(line);
						if(m7_code.find())
						{
							if(!m7_code.group().equals("null"));
								ckno = ckno + m7_code.group() + ",";
						}
					}
					Fight.planeckno = ckno;
					//登机口
					Pattern p8_gtls = Pattern.compile("(?<=DFME_GTLS\\[).*?(?=\\])");
					Matcher m8_gtls = p8_gtls.matcher(line);
					if(m8_gtls.find())
					{
						Pattern p8_code = Pattern.compile("(?<=code=).*?(?=\\,)");
						Matcher m8_code = p8_code.matcher(m8_gtls.group());
						if(m8_code.find())
						{
							Fight.planegtls = m8_code.group();
						}
					}
					//航班状态
					Pattern p9 = Pattern.compile("(?<=ista=).*?(?=\\,)");
					Matcher m9 = p9.matcher(line);
					if(m9.find())
					{
						Fight.planeitsa = m9.group();
					}
					if(displayDataVecotr.containsKey(flno))
					{
						airPlane newplane = displayDataVecotr.get(flno);
						if(!Fight.planesfno.equals("")) {
							newplane.planesfno = Fight.planesfno;
						}
						if(!Fight.planearno2.equals("")) {
							newplane.planearno2 = Fight.planearno2;
						}
						if(!Fight.planearno3.equals("")) {
							newplane.planearno3 = Fight.planearno3;
						}
						if(!Fight.planefett.equals("")) {
							newplane.planefett = Fight.planefett;
						}
						if(!Fight.planeckno.equals("")) {
							newplane.planeckno = Fight.planeckno;
						}
						if(!Fight.planegtls.equals("")) {
							newplane.planegtls = Fight.planegtls;
						}
						if(!Fight.planeitsa.equals("")) {
							newplane.planeitsa = Fight.planeitsa;
						}
						displayDataVecotr.replace(flno, newplane);	
					}
					else {
						displayDataVecotr.put(flno, Fight);
					}
				}
 			    ArrayList<airPlane> ff = new ArrayList<airPlane>();
				Set<String> flidSet=displayDataVecotr.keySet();
				if(flidSet.size()!= 0)
				{
					for(String ss:flidSet) {
						ff.add(displayDataVecotr.get(ss));
					}
					publish(ff);
				}
			 }
			 } 
			return null;
		}
		
		@Override
		protected void process(List<ArrayList<airPlane>> chunks) {
			// TODO 自动生成的方法存根
			super.process(chunks);
			for(ArrayList<airPlane> v:chunks){
				defaultTableModel.setRowCount(0);
				for(airPlane flight:v) {
					defaultTableModel.addRow(new String[] {
						flight.planeflno,flight.planesfno,flight.planearno2,flight.planearno3,
						flight.planefett,flight.planeckno,flight.planegtls,flight.planeitsa
					});
				}
			}	
		}		
	}
}
