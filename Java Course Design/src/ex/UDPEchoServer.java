package ex;//实验五服务器

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.util.Scanner;

public class UDPEchoServer extends UDPServer {

	private final static int DEFAULT_PORT=9999;
	
	public UDPEchoServer() {
		super(DEFAULT_PORT);
		// TODO Auto-generated constructor stub
	}

	
	@Override
	public void response(DatagramSocket socket, DatagramPacket incoming) {
		// TODO Auto-generated method stub
		try {
			BufferedReader buffer = new BufferedReader(new FileReader("FDSdata.txt"));
			String line = null;
			while((line = buffer.readLine()) != null)
			{
				if(!"no data!".equals(line))
				{
					byte[] outData = line.getBytes();
					incoming = new DatagramPacket(outData, outData.length,incoming.getAddress(),incoming.getPort());
					socket.send(incoming);
					Thread.sleep(50);
				}
				else {
					break;
				}
			}
			String receiveData = new String(incoming.getData(),0,incoming.getLength(),"gb2312");
			System.out.println(receiveData);
			socket.send(incoming);
		} catch (IOException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		} catch (InterruptedException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
	}


	public static void main(String[] args) {
		UDPServer server=new UDPEchoServer();
		new Thread(server).start();
	}
}
