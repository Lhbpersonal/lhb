package ex;//ʵ���

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Hashtable;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
/*
 * ���������ݽṹ�����
 */
public class Ex2 {
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		File input = new File("fdsdata.txt");
		Hashtable<String, airPlane> displayDataVecotr = new Hashtable<String,airPlane>();
		new ReceivedData(input, displayDataVecotr).start();
		new OutputData(displayDataVecotr).start();
		}
}
class ReceivedData extends Thread {
	File input;
	Hashtable<String, airPlane> displayDataVecotr;
	
	public ReceivedData(File input, Hashtable<String, airPlane> displayDataVecotr) {
		this.input = input;
		this.displayDataVecotr = displayDataVecotr;
	}
	
	@Override
	public void run() {
		// TODO �Զ����ɵķ������
		try(BufferedReader in = new BufferedReader(new InputStreamReader(
				new FileInputStream(input)));) {
			String line;
			while ((line = in.readLine()) != null) {
				String ch = "";
				String flno = "";
				String ckno = "";
				String[] tt = null;
				//�����ʶ
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
					//�������
					Pattern p2 = Pattern.compile("(?<=sfno=).*?(?=\\,)");
					Matcher m2 = p2.matcher(line);
					if(m2.find())
					{
						if(!m2.group().equals("null"))
							Fight.planesfno = m2.group();
					}
					//��ͣ
					Pattern p4 = Pattern.compile("(?<=arno=2, apcd=).*?(?=\\,)");
					Matcher m4 = p4.matcher(line);
					if(m4.find())
					{
						if(!m4.group().equals("null"))
							Fight.planearno2 = m4.group();
					}
					//Ŀ��
					Pattern p5 = Pattern.compile("(?<=arno=3, apcd=).*?(?=\\,)");
					Matcher m5 = p5.matcher(line);
					if(m5.find())
					{
						if(!m5.group().equals("null"))
							Fight.planearno3 = m5.group();
					}
					//��Ʊʱ��
					Pattern p6 = Pattern.compile("(?<=fett=).*?(?=\\,)");
					Matcher m6 = p6.matcher(line);
					if(m6.find())
					{
						if(!m6.group().equals("null"))
							Fight.planefett = m6.group();
					}
					//��̨
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
					//�ǻ���
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
					//����״̬
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
			}
			displayDataVecotr.put("END",new airPlane());
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}
	
}
class OutputData extends Thread {
	
	Hashtable<String, airPlane> outputData;
	
	public OutputData(Hashtable<String, airPlane> outputData) {
		this.outputData = outputData;
	}
	
	@Override
	public void run() {
		// TODO �Զ����ɵķ������
		//super.run();
		try {
			FileOutputStream out = new FileOutputStream("prcatice2.txt");
			int time = 1;
			while(!outputData.containsKey("END")) {
				synchronized(outputData) {
					Set<String> flidSet=outputData.keySet();
					out.write(new String("��" + time + "�����ʵʱ������Ϣ\n").getBytes());
					if(flidSet.size()!=0)
					{
						for(String ss:flidSet) {
							airPlane temp = outputData.get(ss);
							out.write(new String(temp.planeflno + "  " + 
									temp.planesfno + "  " + temp.planearno2 + "  " + 
									temp.planearno3 + "  " + temp.planefett + "  " + 
									temp.planeckno + "  " + temp.planegtls + "  " +
									temp.planeitsa + "\n").getBytes());
						}
					}
					out.write(new String("*************************************************\n").getBytes());
					time = time + 1;
					sleep(1);
				}
			}
			out.close();
		} catch (FileNotFoundException e) {
			// TODO �Զ����ɵ� catch ��
			e.printStackTrace();
		} catch (IOException e) {
			// TODO �Զ����ɵ� catch ��
			e.printStackTrace();
		} catch (InterruptedException e) {
			// TODO �Զ����ɵ� catch ��
			e.printStackTrace();
		}
		
	}
}

