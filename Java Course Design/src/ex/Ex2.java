package ex;//实验二

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
 * 阻塞的数据结构类测试
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
		// TODO 自动生成的方法存根
		try(BufferedReader in = new BufferedReader(new InputStreamReader(
				new FileInputStream(input)));) {
			String line;
			while ((line = in.readLine()) != null) {
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
		// TODO 自动生成的方法存根
		//super.run();
		try {
			FileOutputStream out = new FileOutputStream("prcatice2.txt");
			int time = 1;
			while(!outputData.containsKey("END")) {
				synchronized(outputData) {
					Set<String> flidSet=outputData.keySet();
					out.write(new String("第" + time + "毫秒的实时出港信息\n").getBytes());
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
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		} catch (IOException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		} catch (InterruptedException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		
	}
}

