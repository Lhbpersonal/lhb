package ex;//实验四服务器
import java.io.*;
import java.nio.*;
import java.nio.channels.*;
import java.nio.charset.*;
import java.net.*;
import java.util.*;

public class EchoServer{
  private Selector selector = null;
  private ServerSocketChannel serverSocketChannel = null;
  private int port = 9000;
  private Charset charset=Charset.forName("GBK");

  public EchoServer()throws IOException{
    selector = Selector.open();
    serverSocketChannel= ServerSocketChannel.open();
    serverSocketChannel.socket().setReuseAddress(true);
    serverSocketChannel.configureBlocking(false);
    serverSocketChannel.socket().bind(new InetSocketAddress(port));
    System.out.println("服务器启动");
  }

  public void service() throws IOException{
    serverSocketChannel.register(selector, SelectionKey.OP_ACCEPT );
    while (selector.select() > 0 ){
      Set readyKeys = selector.selectedKeys();
      Iterator it = readyKeys.iterator();
      while (it.hasNext()){
         SelectionKey key=null;
         try{
            key = (SelectionKey) it.next();
            it.remove();

            if (key.isAcceptable()) {
              ServerSocketChannel ssc = (ServerSocketChannel) key.channel();
              SocketChannel socketChannel = (SocketChannel) ssc.accept();
              System.out.println("接收到客户连接，来自:" +
                                 socketChannel.socket().getInetAddress() +
                                 ":" + socketChannel.socket().getPort());
              socketChannel.configureBlocking(false);
              //ByteBuffer buffer = ByteBuffer.allocate(1024);
              BufferedReader buffer = new BufferedReader(new InputStreamReader(new FileInputStream(new File("fdsdata.txt"))));
              socketChannel.register(selector,
                                     SelectionKey.OP_READ |
                                     SelectionKey.OP_WRITE, buffer);
              String ln=null;
        	    ln=buffer.readLine();
        	    if(ln.equals("no data")){
      	        buffer.close();
      	    }
            }
            if (key.isReadable()) {
                receive(key);
            }
            if (key.isWritable()) {
                send(key);
            }
        }catch(IOException e){
           //e.printStackTrace();
           try{
               if(key!=null){
                   key.cancel();
                   key.channel().close();
               }
           }catch(Exception ex){e.printStackTrace();}
        }
      }//#while
    }//#while
  }

  public void send(SelectionKey key)throws IOException{
	  SocketChannel socketChannel = (SocketChannel) key.channel();
		BufferedReader reader=(BufferedReader)key.attachment();
		String ln=null;
	    ln=reader.readLine();
		
		ByteBuffer echoBuffer = charset.encode(ln+"\r\n");
		echoBuffer.rewind();
		while(echoBuffer.hasRemaining()) {
			try {
				socketChannel.write(echoBuffer);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		echoBuffer.compact();
		 if(ln.equals("no data")){
		        key.cancel();
		        reader.close();
		        socketChannel.close();
		        System.out.println("关闭与客户的连接");
		        	
		     }
  }

  public void receive(SelectionKey key)throws IOException{
    ByteBuffer buffer=(ByteBuffer)key.attachment();

    SocketChannel socketChannel=(SocketChannel)key.channel();
    ByteBuffer readBuff= ByteBuffer.allocate(1024);
    socketChannel.read(readBuff);
    readBuff.flip();

    buffer.limit(buffer.capacity());
    buffer.put(readBuff);
  }

  public String decode(ByteBuffer buffer){  //解码
    CharBuffer charBuffer= charset.decode(buffer);
    return charBuffer.toString();
  }
  public ByteBuffer encode(String str){  //编码
    return charset.encode(str);
  }

  public static void main(String args[])throws Exception{
    EchoServer server = new EchoServer();
    server.service();
  }
}
