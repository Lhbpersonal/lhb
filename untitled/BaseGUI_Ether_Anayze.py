from scapy.all import *
from tkinter import *
import time, threading
import tkinter.messagebox as messagebox

from scapy.layers.l2 import Ether


class Application(Frame):
    def __init__(self,master=None):
        Frame.__init__(self,master)
        self.pack()
        self.count = 0  # 记录捕获数据帧的个数
        self.createWidgets()
        self.sniffFlag=True  # 设置控制捕获线程运行的标志变量

    def createWidgets(self):
        #创建控制面板
        self.controlFrame=Frame(self)
        self.countLabel = Label(self.controlFrame, text='请输入待捕获的数据帧数：')
        self.countLabel.pack(side=LEFT)
        countVar = StringVar(value='0') # 将label标签的内容设置为字符类型，用var来接受用户输入的数据帧的个数
        self.countInput = Entry(self.controlFrame, textvariable=countVar)
        self.countInput.pack(side=LEFT)
        # 在创建控制面板设置startListenButton按键
        self.startListenButton = Button(self.controlFrame, text='开始捕获', command=self.start_sniff)
        self.startListenButton.pack(side=LEFT)
        # 在创建控制面板放置clearButton按键
        self.clearButton = Button(self.controlFrame, text='清空数据', command=self.clearData)
        self.clearButton.pack(side=LEFT)
        # 在创建控制面板放置stopListenButton按键
        self.stoptListenButton = Button(self.controlFrame, text='停止捕获', command=self.stop_sniff)
        self.stoptListenButton.pack(side=RIGHT)
        self.controlFrame.pack(side=TOP, fill=Y)

        # 创建显示捕获数据的窗口
        self.resultTextFrame = Frame(self)
        # 创建显示捕获数据的文本框
        self.resultText= Text(self.resultTextFrame)
        # 创建一个纵向滚动的滚动条，铺满Y方向
        self.s1 = Scrollbar(self.resultTextFrame, orient=VERTICAL)
        #HORIZONTAL 设置水平方向的滚动条，默认是竖直
        self.s2 = Scrollbar(self.resultTextFrame, orient=HORIZONTAL)
        self.s1.pack(side=RIGHT, fill=Y)
        self.s2.pack(side=BOTTOM, fill=X)
        self.s1.config(command=self.resultText.yview)
        self.s2.config(command=self.resultText.xview)
        self.resultText['yscrollcommand'] = self.s1.set
        self.resultText['xscrollcommand'] = self.s2.set
        self.resultText.pack(side=LEFT, fill=BOTH)
        self.resultTextFrame.pack(side=BOTTOM, fill=Y)


    def start_sniff(self):
        if  self.sniffFlag is True:
            answer= messagebox.askyesnocancel(title='确认窗口', message='是否开始报文捕获？')
            if answer is False:
                print("停止报文捕获！")
                return
            elif answer is True:
                print("开始新的报文捕获！")
                self.startListenButton["state"] = 'disabled'
                self.stoptListenButton["state"] = 'normal'
                self.sniffFlag=False
                t = threading.Thread(target=self.PDU_sniff, name='LoopThread')
                t.start()

    def PDU_sniff(self):
        # print("抓包条件：")
        # 此处可以添加代码设置捕获条件。。。。。。
        # print("监听的网络接口：")
        # 此处可以设置监听的网络接口。。。。。。
        # sniff(prn=(lambda x: ether_monitor_callback(x)),filter=' ',stop_filter=(lambda x:self.sniffFlag),iface='')
        SFliter = 'ether proto 0x0800 and ether src bc:a8:a6:94:71:e5 and ether dst 90:83:4b:3b:a0:10'
        sniffNum=int(self.countInput.get())
        if sniffNum>0:
            # for i in range
            sniff(prn=(lambda x: self.ether_monitor_callback(x)),filter = SFliter,stop_filter=(lambda x: self.sniffFlag),count=sniffNum)
            self.stop_sniff()
        elif sniffNum==0:
            sniff(prn=(lambda x: self.ether_monitor_callback(x)), filter = SFliter,stop_filter=(lambda x: self.sniffFlag))
        else:
            messagebox.showwarning(title='Warning:', message='捕获报文数必须大于等于0!(0：表示一直捕获）')
            self.stop_sniff()

    # 停止捕获线程
    def stop_sniff(self):
        self.startListenButton["state"] = 'normal'
        self.stoptListenButton["state"] = 'disable'
        self.sniffFlag=True

    # 清空捕获数据
    def clearData(self):
        if self.sniffFlag is True:
            self.resultText.delete(1.0,END)
            self.count=0
        else:
            messagebox.showinfo(title='友情提示', message="请先停止捕获！！")

    def ether_monitor_callback(self, pkt):
        self.count += 1
        self.resultText.insert('end','时间：'+time.ctime(time.time())+'\n')
        self.resultText.insert('end', '捕获到第：' + str(self.count) + '个以太帧\n')
        self.resultText.insert('end', '目的MAC：' + pkt[Ether].dst + '\n')
        self.resultText.insert('end', '源MAC：' + pkt[Ether].src + '\n')
        self.resultText.insert('end', '上层协议类型：' + str(pkt[Ether].type) + '\n')
        self.resultText.insert('end', '数据：' + str(pkt[Ether].payload) + '\n')
        self.resultText.insert('end', '\n')
        time.sleep(1)

# 创建并设置程序运行的主窗体
app = Application()
# 设置窗口标题
app.master.title('GUI 报文分析器/编辑器')
# 主消息循环
app.mainloop()

