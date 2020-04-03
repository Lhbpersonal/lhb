package ex;//实验一

//import java.util.Scanner;
import java.io.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Ex1 {
	
	public static void main(String[] args) {
		// TODO 自动生成的方法存根
		
		try {
//			File f = new File("D:\\individual Files\\Java Course Design\\网络编程技术课内实验一\\FDSdata.txt");
//			FileReader fin = new FileReader(f);
			//File f = new File("result.txt");
			//OutputStream out = new FileOutputStream(f);
			
			PrintWriter pout =new PrintWriter(new FileWriter("result.txt"),true);
			FileReader fin = new FileReader("FDSdata.txt");
			BufferedReader bin = new BufferedReader(fin);
			
			pout.println("航班号     共享航班     经停站     目的站     办票时间     值机柜台     登机口     航班状态");
			System.out.println("航班号     共享航班     经停站     办票时间     目的站     值机柜台     登机口     航班状态");
			
			String linestr = null;
			linestr = bin.readLine();
			while(linestr != null) {
				
				//航班标识
				Pattern p1 = Pattern.compile("(?<=ffid=).*?(?=\\,)");
				Matcher m1 = p1.matcher(linestr);
				if(m1.find())
				{
					
					String[] tt = m1.group().split("-");
					if(tt[1].length() == 4)
					{
						pout.print(tt[1] + "       ");
						System.out.print(tt[1] + "       ");
					}
					else if(tt[1].length() == 3)
					{
						pout.print(tt[1] + "        ");
						System.out.print(tt[1] + "        ");
					}
					else
					{
						pout.print(tt[1] + "     ");
						System.out.print(tt[1] + "     ");
					}
				}
				else
				{
					
					pout.print("-----     ");
					System.out.print("-----     ");
					
				}
				
				//共享航班号
				Pattern p2 = Pattern.compile("(?<=sfno=).*?(?=\\,)");
				Matcher m2 = p2.matcher(linestr);
				if(m2.find())
				{
					
					pout.print(m2.group() + "         ");
					System.out.print(m2.group() + "         ");
					
				}
				else
				{
					pout.print("-----        ");
					System.out.print("-----        ");
					
				}
				
				//始发，经停，目的地
				/*
				Pattern p3 = Pattern.compile("(?<=arno=1, apcd=).*?(?=\\,)");
				Matcher m3 = p3.matcher(linestr);
				if(m3.find())
				{
					
					pout.print(m3.group() + "        ");
					System.out.print(m3.group() + "        ");
					
				}
				else
				{
					pout.print("-----       ");
					System.out.print("-----       ");
					
				}*/
				
				Pattern p4 = Pattern.compile("(?<=arno=2, apcd=).*?(?=\\,)");
				Matcher m4 = p4.matcher(linestr);
				if(m4.find())
				{
					
					pout.print(m4.group() + "         ");
					System.out.print(m4.group() + "         ");
					
				}
				else
				{
					pout.print("-----       ");
					System.out.print("-----       ");
					
				}
				
				Pattern p5 = Pattern.compile("(?<=arno=3, apcd=).*?(?=\\,)");
				Matcher m5 = p5.matcher(linestr);
				if(m5.find())
				{
					
					pout.print(m5.group() + "       ");
					System.out.print(m5.group() + "       ");
					
				}
				else
				{
					pout.print("-----       ");
					System.out.print("-----       ");
					
				}
				
				//办票时间
				Pattern p6 = Pattern.compile("(?<=fett=).*?(?=\\,)");
				Matcher m6 = p6.matcher(linestr);
				if(m6.find())
				{
					
					pout.print(m6.group() + "       ");
					System.out.print(m6.group() + "       ");
					
				}
				else
				{
					pout.print("-----       ");
					System.out.print("-----       ");
					
				}
				
				//柜台
				Pattern p7_ckls = Pattern.compile("(?<=ckls=).*?(?=\\])");
				Matcher m7_ckls = p7_ckls.matcher(linestr);
				if(m7_ckls.find())
				{
					
					//String[] tt = m1.group().split("");
					//String s = tt[1];
					Pattern p7_code = Pattern.compile("(?<=code=).*?(?=\\,)");
					Matcher m7_code = p7_code.matcher(m7_ckls.group());
					if(m7_code.find())
					{
						
						pout.print(m7_code.group() + "          ");
						System.out.print(m7_code.group() + "          ");
						
					}
					
				}
				else
				{
					pout.print("-----        ");
					System.out.print("-----        ");
					
				}
				
				//登机口
				Pattern p8_gtls = Pattern.compile("(?<=DFME_GTLS\\[).*?(?=\\])");
				Matcher m8_gtls = p8_gtls.matcher(linestr);
				if(m8_gtls.find())
				{
					
					//String[] tt = m1.group().split("");
					//String s = tt[1];
					Pattern p8_code = Pattern.compile("(?<=code=).*?(?=\\,)");
					Matcher m8_code = p8_code.matcher(m8_gtls.group());
					if(m8_code.find())
					{
						
						pout.print(m8_code.group() + "          ");
						System.out.print(m8_code.group() + "          ");
						
					}
					
				}
				else
				{
					pout.print("-----        ");
					System.out.print("-----        ");
					
				}
				
				//航班状态
				Pattern p9 = Pattern.compile("(?<=ista=).*?(?=\\,)");
				Matcher m9 = p9.matcher(linestr);
				if(m9.find())
				{
					
					pout.println(m9.group() + "     ");
					System.out.println(m9.group() + "     ");
					
				}
				else
				{
					pout.println("-----      ");
					System.out.println("-----      ");
					
				}
				linestr = bin.readLine();
				
			}
			
			if(bin != null) {
				
				bin.close();
				
			}
			
			
		} catch (FileNotFoundException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		} catch (IOException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		
		
	}

}
