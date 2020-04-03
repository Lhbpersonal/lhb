package ex;//实验五服务器封装抽象类

import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.SocketException;
import java.net.SocketTimeoutException;
import java.util.logging.Level;
import java.util.logging.Logger;

public abstract class UDPServer implements Runnable {

	private final int port;
	private final int bufferSize;
	private Logger logger=Logger.getLogger(UDPServer.class.getCanonicalName());
	private volatile boolean isShutDown=false;
	
	public UDPServer(int port, int bufferSize) {
		this.port = port;
		this.bufferSize = bufferSize;
	}

	public UDPServer(int port) {
		this(port,8127);
	}

	@Override
	public void run() {
		// TODO Auto-generated method stub
		byte[] buffer=new byte[bufferSize];
		
		try (DatagramSocket socket=new DatagramSocket(port)){
			logger.log(Level.INFO,"Server is listening on port "+port);
			socket.setSoTimeout(60000);
			while(true) {
				if(isShutDown) return;
				DatagramPacket incoming=new DatagramPacket(buffer,buffer.length);
				try {
					socket.receive(incoming);
					logger.log(Level.INFO,"client's address is "+incoming.getAddress()+":"+incoming.getPort());
					this.response(socket,incoming);
				} catch (SocketTimeoutException e) {
					// TODO Auto-generated catch block
					logger.log(Level.SEVERE,"Recive Data Timeout ",e);
					if(isShutDown) return;
				} catch (IOException e) {
					// TODO Auto-generated catch block
					logger.log(Level.WARNING,e.getMessage(),e);
				}
			}
			
		} catch (SocketException e) {
			// TODO Auto-generated catch block
			logger.log(Level.SEVERE,"Could not bind to port "+port,0);
		}
	}

	public void response(DatagramSocket socket, DatagramPacket incoming) {
		// TODO Auto-generated method stub
		
	}
	public void shutDown( ) {
		this.isShutDown=true;
	}
}
