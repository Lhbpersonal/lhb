from tkinter import *
import tkinter as tk
import tkinter.messagebox as messagebox
from tkinter.ttk import Treeview,Style
from scapy.all import *
from scapy.layers.inet import IP
from scapy.layers.l2 import Ether, ARP


class Application(tk.Tk):
    def __init__(self):  #定义构造方法 初始化方法 self自己，this
        tk.Tk.__init__(self) #调用父类tkinter
        self.createWidgets() #成员方法调用 包含成员主键

    def createWidgets(self):
        self.title('GUI 报文分析器/编辑器')
        self.geometry('1000x800')#窗口大小
        #PanedWindow是可供用户调整的框架类，默认是垂直分割，sashrelief设置分割线的样式，
        self.mainPanedWindow = PanedWindow(self,sashrelief=RAISED,sashwidth=5)#左右分割窗体
        #创建选择发送报文类型的导航树并放到左右分隔窗体的左侧
        self.protocolsTree = Treeview() #实例化Treeview对象
        self.mainPanedWindow.add(self.createProtocolsTree())#引用一个函数来构造
        # 创建并将协议编辑区窗体放到左右分隔窗体的右侧
        self.protocolEditorFrame = Frame() #编辑不同协议数据单元的编辑窗体
        self.mainPanedWindow.add(self.protocolEditorFrame)
        self.mainPanedWindow.pack(fill=BOTH,expand=1)

     #设置协议
    def createProtocolsTree(self):
        """""
        创建PDU导航树
         ：return：PDU导航树
         """

        self.protocolsTree.heading('#0',text='选择发送报文类型',anchor='w')
        # 参数：parent，index，iid=None，**kw（父节点，插入的位置，id，显示出的文本）
        # 网络接口层协议
        #创建顶级节点
        ether_layer_tree_entry = self.protocolsTree.insert("",0,"网络接口层",text="网络接口层")
        mac_frame_tree_entry = self.protocolsTree.insert(ether_layer_tree_entry,1,"Ethernet帧",text="Ethernet协议")

        #网络层协议
        #arp协议
        ip_layer_tree_entry = self.protocolsTree.insert("",1,"网络层",text="网络层")
        arp_packet_tree_entry = self.protocolsTree.insert(ip_layer_tree_entry,1,"ARP数据包",text="ARP数据包")

        #IP协议
        ip_packet_tree_entry = self.protocolsTree.insert(ip_layer_tree_entry,2,"IP数据包",text="IP数据包")

        #选择事件
        self.protocolsTree.bind('<<TreeviewSelect>>',self.on_click_protocols_tree)
        style = Style(self)#设定风格
        self.protocolsTree.pack()
        return self.protocolsTree #返回到添加的部分

    # TreeView单击事件响应函数
    def on_click_protocols_tree(self,event): #调用self自己以外还会传递event
        """
        协议导航树单击事件响应函数
        :param event :TreeView单击事件
        :return ：None
        """
        #调用成员变量self
        self.selectedItem = event.widget.selection()#事件在哪个组件发生，找到组件信息并返回保存在Item里 保存节点id
        #event.widget获取Treeview对象，调用selection获取选择对象名称
        #清空protocolEditorFrame上的控件
        for widget in self.protocolEditorFrame.winfo_children():
            widget.destroy()
        #添加用户所选择界面
        if self.selectedItem[0] == "Ethernet帧":
            self.createEtherFrameWidgets() #调用以太帧函数
        elif self.selectedItem[0] == "ARP数据包":
            self.createARPWidgets()
        elif self.selectedItem[0] == "IP数据包":
            self.createIPWidgets()


    def createEtherFrameWidgets(self):
      etherFrame = Frame(self.protocolEditorFrame)
      dstmacLabel = Label(etherFrame,text='请输入目的Mac地址 ：')
      dstmacLabel.pack()
      desMacVar = StringVar(value='FF:FF:FF:FF:FF:FF')
      self.dstmacInput = Entry(etherFrame,textvariable=desMacVar)
      self.dstmacInput.pack()

      payloadLabel = Label(etherFrame, text='请输入待发送数据帧的payload ：')
      payloadLabel.pack()
      payLoadVar = StringVar(value='12345678')
      self.payloadInput = Entry(etherFrame, textvariable=payLoadVar)
      self.payloadInput.pack()

      countLabel = Label(etherFrame, text='请输入待发送的数据帧数 ：')
      countLabel.pack()
      countVar = StringVar(value='3')
      self.countInput = Entry(etherFrame, textvariable=countVar)
      self.countInput.pack()
      #设置发送数据的控制按钮
      sendButton = Button(etherFrame,text='发送',command=self.sendEtherFrame)
      sendButton.pack()
      #用线程控制连续发送 定义了个处理函数continueSendEtherFrame
      self.continueSendButton = Button(etherFrame,text='连续发送',command=self.continueSendEtherFrame)
      self.continueSendButton.pack()
      resultTextFrame = Frame(etherFrame)
      self.resultText = Text(resultTextFrame,height=20)
      #创建一个纵向滚动的滚动条，铺满Y方向
      s1 = Scrollbar(resultTextFrame,orient=VERTICAL)
      # HORIZONTAL 设置水平方向的滚动条，默认是竖直
      s2 = Scrollbar(resultTextFrame,orient=HORIZONTAL)
      s1.pack(side=RIGHT,fill=Y)
      s2.pack(side=BOTTOM,fill=X)
      s1.config(command=self.resultText.yview)
      s2.config(command=self.resultText.xview)
      self.resultText['yscrollcommand'] = s1.set
      self.resultText['xscrollcommand'] = s2.set
      self.resultText.pack(side=LEFT,fill=BOTH)
      resultTextFrame.pack()
      etherFrame.pack()

    def sendEtherFrame(self):
        dstmac = self.dstmacInput.get()
        payLoad = self.payloadInput.get()
        count = self.countInput.get()
        messagebox.showinfo('Message','目的MAC地址： %s' % dstmac)
        try:
            etherFrame = Ether(dst=dstmac) / payLoad
            etherFrameInfoStr = '待发送帧信息\n' +\
                                'des:' + dstmac +'\n' + \
                                'src' + etherFrame.src + '\n' \
                                'payload' + payLoad + '\n'

            self.resultText.insert('end',etherFrame)
            self.resultText.insert('end',str(etherFrame)+'\n')
            # 在多行文本框text中显示发送帧的信息
            for i in range(int(count)):
                sendp(etherFrame)
                self.resultText.insert('end','成功发送第'+str(i)+'个以太帧。\n')
        except ValueError as e:
            self.resultText.tag_config('tag',foreground='blue')
            self.resultText.insert('end','赋值异常,发送失败\n','tag')
        except Exception as e:
            self.resultText.tag_config('tag',foreground='red')
            self.resultText.insert('end','发送数据失败\n','tag')
        finally:
            pass

    def continueSendEtherFrame(self):
        if self.continueSendButton['text'] == '连续发送':
         dstmac = self.dstmacInput.get()
         payLoad = self.payloadInput.get()
         messagebox.showinfo('Message','即将开始连续发送数据帧: %s' % dstmac)
         try:
            etherFrame = Ether(dst=dstmac) / payLoad
            etherFrameInfoStr = '待发送帧信息\n' + \
                                'des:' + dstmac + '\n' + \
                                'src' + etherFrame.src + '\n' \
                                 'payload' + payLoad + '\n'
            self.resultText.insert('end',etherFrame)
            self.resultText.insert('end',str(etherFrame) + '\n')
            #在多行文本框text中显示发送帧的信息
            self.stopSending = threading.Event()#用来终止数据包发送线程的线程事件
            t = threading.Thread(target=self.sendEtherFrameThread,args=(etherFrame,))
            t.setDaemon(True)
            t.start() #启动线程
            self.continueSendButton['text'] = '停止连续发送' #启动后换按钮信息
         except ValueError as e:
            self.resultText.tag_config('tag', foreground='blue')
            self.resultText.insert('end', '赋值异常,发送失败\n', 'tag')
         finally:
            pass
        else:
       # 终止数据包发送线程
         self.stopSending.set() #设置停止发送对象
         self.continueSendButton['text'] = '连续发送'

    def sendEtherFrameThread(self,etherFrame):
        # 对发送的数据包次数进行计数，用于计算发送速度
        count = 0
        self.stopSending.clear()
        while not self.stopSending.is_set(): #判断event的标志是否为true，即是否点击“停止按键
            try:
                sendp(etherFrame)
                count = count+1
                self.resultText.insert('end',"成功发送第"+str(count)+'帧\n')
                print("成功发送第"+str(count)+'帧\n')
            except Exception as e:
                self.resultText.tag_config('tag', foreground='red')
                self.resultText.insert('end', '发送数据失败\n', 'tag')

    def createARPWidgets(self):
         arpFrame = Frame(self.protocolEditorFrame)
         typeLabel = Label(arpFrame,text='请输入ARP请求包的类型：')
         typeLabel.pack()
         # 将Label标签的内容设置为字符类型，用var来接收用户发送的报文类型
         typeVar = IntVar(value='1')
         self.typeInput = Entry(arpFrame,textvariable=typeVar)
         self.typeInput.pack()
         #补充完善其他信息
         ip_dst_Label = Label(arpFrame,text='请输入目的IP：')
         ip_dst_Label.pack()
         ip_dst = StringVar(value='192.168.1.6')
         self.ip_input = Entry(arpFrame,textvariable=ip_dst)
         self.ip_input.pack()

         arp_sendButton = Button(arpFrame,text='发送',command=self.sendARPFrame)
         arp_sendButton.pack()
         arpresultTextFrame = Frame(arpFrame)
         self.arpresultText = Text(arpresultTextFrame, height=20)
         # 创建一个纵向滚动的滚动条，铺满Y方向
         s1 = Scrollbar(arpresultTextFrame, orient=VERTICAL)
         # HORIZONTAL 设置水平方向的滚动条，默认是竖直
         s2 = Scrollbar(arpresultTextFrame, orient=HORIZONTAL)
         s1.pack(side=RIGHT, fill=Y)
         s2.pack(side=BOTTOM, fill=X)
         s1.config(command=self.arpresultText.yview)
         s2.config(command=self.arpresultText.xview)
         self.arpresultText['yscrollcommand'] = s1.set
         self.arpresultText['xscrollcommand'] = s2.set
         self.arpresultText.pack(side=LEFT, fill=BOTH)
         arpresultTextFrame.pack()
         arpFrame.pack()

    def sendARPFrame(self):
        type = self.typeInput.get()
        ip_dst = self.ip_input.get()
        messagebox.showinfo('Message', '目的IP地址： %s' % ip_dst)
        try:
            arp = ARP(hwdst="00:00:00:00:00:00",pdst=ip_dst,hwsrc="BC:A8:A6:94:71:E5",psrc="192.168.1.6",op=('who-has' if type=='1' else 'is-at'))
            self.arpresultText.insert('end', arp)
            self.arpresultText.insert('end', str(arp) + '\n')
            send(arp)
            self.arpresultText.insert('end','successfull!')
        except ValueError as e:
            self.arpresultText.tag_config('tag',foreground='blue')
            self.arpresultText.insert('end','赋值异常,发送失败\n','tag')
        except Exception as e:
            self.arpresultText.tag_config('tag',foreground='red')
            self.arpresultText.insert('end','发送数据失败\n','tag')
        finally:
            pass

    def createIPWidgets(self):
        IPFrame = Frame(self.protocolEditorFrame)

        desIPLabel = Label(IPFrame, text='请输入目的IP:')
        desIPLabel.pack()
        #desIPLabel.place(x=50, y=50)

        desIP = StringVar(value='192.168.1.4')
        self.desIPEntry = Entry(IPFrame, show=None, textvariable=desIP)  # 显示成明文形式
        self.desIPEntry.pack()
        #self.desIPEntry.place(x=200, y=50)

        # 在window主窗口界面上设定源IP
        srcIPLabel = Label(IPFrame, text='请输入源IP：')
        srcIPLabel.pack()
        #srcIPLabel.place(x=50, y=100)

        srcIP = StringVar(value='192.168.1.6')
        self.srcIPEntry = Entry(IPFrame, show=None, textvariable=srcIP)
        self.srcIPEntry.pack()
        #self.srcIPEntry.place(x=200, y=100)

        # 在window主窗体的界面上设定payload标签
        payloadLabel = Label(IPFrame, text='请输入payload:')
        payloadLabel.pack()  # Label内容content取悦放置位置，自动调节尺寸
        #payloadLabel.place(x=50, y=150)

        payLoad = StringVar(value='############')
        self.payloadEntry = Entry(IPFrame, show=None, textvariable=payLoad)  # 显示成明文形式
        self.payloadEntry.pack()
        #self.payloadEntry.place(x=200, y=150)

        intLabel = Label(IPFrame, text='请输入待发送的报文数')
        intLabel.pack()
        #intLabel.place(x=50, y=200)

        count = StringVar(value='3')
        self.countEntry = Entry(IPFrame, show=None, textvariable=count)  # 显示成明文形式
        self.countEntry.pack()
        #self.countEntry.place(x=200, y=200)

        IP_sendButton = Button(IPFrame, text='发送', command=self.sendIPFrame)
        IP_sendButton.pack()
        IPresultTextFrame = Frame(IPFrame)
        self.IPresultText = Text(IPresultTextFrame, height=20)
        # 创建一个纵向滚动的滚动条，铺满Y方向
        s1 = Scrollbar(IPresultTextFrame, orient=VERTICAL)
        # HORIZONTAL 设置水平方向的滚动条，默认是竖直
        s2 = Scrollbar(IPresultTextFrame, orient=HORIZONTAL)
        s1.pack(side=RIGHT, fill=Y)
        s2.pack(side=BOTTOM, fill=X)
        s1.config(command=self.IPresultText.yview)
        s2.config(command=self.IPresultText.xview)
        self.IPresultText['yscrollcommand'] = s1.set
        self.IPresultText['xscrollcommand'] = s2.set
        self.IPresultText.pack(side=LEFT, fill=BOTH)
        IPresultTextFrame.pack()
        IPFrame.pack()

    def sendIPFrame(self):
        desIP = self.desIPEntry.get()
        srcIP = self.srcIPEntry.get()
        payLoad = self.payloadEntry.get()
        count = self.countEntry.get()
        messagebox.showinfo('Message', '待发送：目的IP地址是 %s 的帧\n源IP地址是：%s' % (desIP, srcIP))
        try:
            ip_packet = IP(dst=desIP, src=srcIP)
            ip_packet_payload = ip_packet / payLoad
            ip_packet_payload.show()
            x = raw(ip_packet_payload)
            ipraw = IP(x)
            ipraw.show()
            checksum_scapy = ipraw[IP].chksum
            print('添加数据后Scapy自动计算的IP首部校验和是：%04x(%s)' % (checksum_scapy, str(checksum_scapy)))
            ip_packet_payload.len = 20 + len(payLoad)
            ip_packet_payload.chksum = 0
            ip_packet_payload.ihl = 5
            ip_packet_payload[IP].show()
            print("/n报文长度是：%s" % str(ip_packet_payload.len))
            x = raw(ip_packet_payload)
            ipString = "".join("%02x" % orb(x) for x in x)
            ipbytes = bytearray.fromhex(ipString)
            checksum_changed_self = self.IP_headchecksum(ipbytes[0:ip_packet_payload.ihl * 4])
            print("改变数据长度后IP首部的校验和是：%04x(%s)" % (checksum_changed_self, str(checksum_changed_self)))
            if checksum_scapy == checksum_changed_self:
                print("校验和正确")
            else:
                print("校验和不正确")
            ip_packet_payload.chksum = checksum_changed_self
            eth = Ether() / ip_packet_payload
            self.IPresultText.insert('end', eth)
            self.IPresultText.insert('end', str(eth) + '\n')
            # 在多行文本框text中显示发送帧的信息
            for i in range(int(count)):
                sendp(eth)
                self.IPresultText.insert('end', '成功发送第'+str(i)+'个IP数据包'+'\n')
        except ValueError as e:
            self.IPresultText.insert('end', '赋值异常\n' + str(e) + '\n')
        except Exception as e:
            self.IPresultText.insert('end', '发送数据失败\n' + str(e) + '\n')
        finally:
            pass

    def IP_headchecksum(self,IP_head):
        check = 0
        headlen = len(IP_head)
        if headlen % 2 == 1:
            IP_head += b'\0'
        i = 0
        while i < headlen:
            temp = struct.unpack('!H', IP_head[i:i + 2])[0]
            check = check + temp
            i = i + 2
        check = (check >> 16) + (check & 0xffff)
        check = check + (check >> 16)
        return ~check & 0xffff

app = Application()
  # 主消息循环：
app.mainloop()
