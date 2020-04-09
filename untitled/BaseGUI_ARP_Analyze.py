from scapy.all import *
from tkinter import *
import tkinter as tk
import time, threading
import tkinter.messagebox as messagebox
from tkinter.font import *

from scapy.layers.l2 import Ether, ARP
from scapy.sendrecv import sniff
from scapy.utils import hexdump


class Application(tk.Tk):
    def __init__(self):
        tk.Tk.__init__(self)
        self.sniffDataList = []
        self.createWidgets()
        self.sniffFlag = True   # 设置控制捕获线程运行的标志变量

    def createWidgets(self):
        self.geometry('1200x800')
        self.title('GUI 报文分析器/编辑器')
        self.count = 0 # 记录捕获数据帧的个数
        # 创建并添加协议分析器控制组件及面板
        self.createControlWidgets()
        # 创建并添加协议分析器主面板
        self.mainPDUShowWindow = PanedWindow(self, orient=tk.VERTICAL, sashrelief=RAISED, sashwidth=5)


        self.createPDUSumPanedWindow()   #协议摘要信息窗格
        self.createPDUAnalysisPanedWindow()  #协议详细解析窗格
        self.createPDUCodePanedWindow()  # 协议报文编码窗格
        self.mainPDUShowWindow.pack(fill=BOTH,expand=1)

    def createControlWidgets(self):
        # 创建控制面板
        controlFrame = Frame()
        self.countLabel = Label(controlFrame, text='请输入待捕获的数据帧数：')
        self.countLabel.pack(side=LEFT)
        countVar = StringVar(value='0')
        self.countInput = Entry(controlFrame, textvariable=countVar)
        self.countInput.pack(side=LEFT)
        # 创建控制面板设置startListenButton按键
        self.startListenButton = Button(controlFrame, text='开始捕获', command=self.start_sniff)
        self.startListenButton.pack(side=LEFT)
        # 创建控制面板设置clearButton按键
        self.clearButton = Button(controlFrame, text='清空数据', command=self.clearData)
        self.clearButton.pack(side=LEFT)
        # 创建控制面板设置stopListenButton按键
        self.stopListenButton = Button(controlFrame, text='停止捕获', command=self.stop_sniff)
        self.stopListenButton.pack(side=RIGHT)
        controlFrame.pack(side=TOP, fill=Y)

    # 创建显示捕获报文的摘要的窗口
    def createPDUSumPanedWindow(self):
        PDUSumFrame = Frame()
        yScroll = Scrollbar(PDUSumFrame, orient=VERTICAL)
        xScroll = Scrollbar(PDUSumFrame, orient=HORIZONTAL)
        # 创建列表框显示捕获报文的摘要
        self.listbox = tk.Listbox(PDUSumFrame,
                                  xscrollcommand=xScroll.set,
                                  yscrollcommand=yScroll.set)
        xScroll['command'] = self.listbox.xview
        yScroll['command'] = self.listbox.yview
        # 显示滚动条
        yScroll.pack(side=RIGHT, fill=Y)
        xScroll.pack(side=BOTTOM, fill=X)
        # 关联用户选择报文进行详细解析的事件
        self.listbox.bind('<Double-ButtonPress>', self.choosedPDUAnalysis)
        self.listbox.pack(fill=BOTH)
        PDUSumFrame.pack(fill=BOTH)
        self.mainPDUShowWindow.add(PDUSumFrame)

    # 创建显示捕获报文分析层解析的窗口
    def createPDUAnalysisPanedWindow(self):
        PDUAnalysisFrame = Frame()
        self.PDUAnalysisText = Text(PDUAnalysisFrame)
        # 显示滚动条
        s1 = Scrollbar(PDUAnalysisFrame, orient=VERTICAL)
        s1.pack(side=RIGHT, fill=Y)
        s1.config(command=self.PDUAnalysisText.yview)
        self.PDUAnalysisText['yscrollcommand'] = s1.set
        # 显示组件
        self.PDUAnalysisText.pack(fill=BOTH)
        PDUAnalysisFrame.pack(fill=BOTH)
        self.mainPDUShowWindow.add(PDUAnalysisFrame)

    # 创建显示捕获报文原始编码信息的窗口
    def createPDUCodePanedWindow(self):
        # 创建显示捕获数据的窗口
        PDUCodeFrame = Frame()
        # 创建显示捕获数据的文本框
        self.PDUCodeText = Text(PDUCodeFrame)
        s1 = Scrollbar(PDUCodeFrame, orient=VERTICAL)
        s1.pack(side=RIGHT, fill=Y)
        s1.config(command=self.PDUCodeText.yview)
        self.PDUCodeText['yscrollcommand'] = s1.set
        self.PDUCodeText.pack(fill=BOTH)
        PDUCodeFrame.pack(side=BOTTOM, fill=BOTH)
        self.mainPDUShowWindow.add(PDUCodeFrame)

    #启动捕获线程
    def start_sniff(self):
        if self.sniffFlag is True:
            answer = messagebox.askokcancel(title='确认窗口',message='是否开始报文截获？')
            if answer is False:
                print("停止报文捕获！")
                return
            elif answer is True:
                print("开始新的报文截获！")
                self.startListenButton["state"] = 'disabled'
                self.stopListenButton["state"] = 'normal'
                self.sniffFlag = False
                t = threading.Thread(target=self.PDU_sniff, name='LoopThread')
                t.start()

    def PDU_sniff(self):
        sniffNum = int(self.countInput.get())
        if sniffNum > 0:
            sniff(prn=(lambda x: self.ether_monitor_callback(x)), filter = 'arp',stop_filter=(lambda x: self.sniffFlag), count=sniffNum )
        elif sniffNum == 0:
            sniff(prn=(lambda x: self.ether_monitor_callback(x)), filter = 'arp',stop_filter=(lambda x: self.sniffFlag), count=sniffNum)
        else:
            messagebox.showwarning(title='warning:', message='捕获报文数大于等于0！（0代表一直捕获）')
            self.stop_sniff()


    # 停止捕获线程
    def stop_sniff(self):
        self.startListenButton["state"] = 'normal'
        self.stopListenButton["state"] = 'disable'
        self.sniffFlag = True

    # 清空捕获线程
    def clearData(self):
        if self.sniffFlag is True:
            self.listbox.delete(0, END)
            self.sniffDataList = []
            self.PDUAnalysisText.delete(1.0, END)
            self.PDUCodeText.delete(1.0, END)
            self.count = 0
        else:
            messagebox.showinfo(title='友情提示', message="请先停止捕获！")

    def ether_monitor_callback(self, pkt):
        self.count += 1
        pktSummaryInfo = str(self.count)+' ' + pkt.summary()
        self.sniffDataList.append(pkt)   # 把sniff函数抓取到的数据包加入到捕获队列
        self.listbox.insert(END, pktSummaryInfo)
        time.sleep(1) # 让程序休眠1秒

    def choosedPDUAnalysis(self, event):
        choosePDUNum = self.listbox.curselection()[0]
        choosedPacket = self.sniffDataList[choosePDUNum]
        self.PDUAnalysisText.delete(1.0,END)
        self.PDUAnalysisText.insert('end', '以太帧目的MAC：' + choosedPacket[Ether].dst + '\n')
        self.PDUAnalysisText.insert('end', '以太帧源MAC：' + choosedPacket[Ether].src + '\n')
        self.PDUAnalysisText.insert('end', '目的MAC：' + choosedPacket[ARP].hwdst + '\n')
        self.PDUAnalysisText.insert('end', '源MAC：' + choosedPacket[ARP].hwsrc + '\n')
        self.PDUAnalysisText.insert('end', '目的IP：' + choosedPacket[ARP].pdst + '\n')
        self.PDUAnalysisText.insert('end', '源IP：' + choosedPacket[ARP].psrc + '\n')
        self.PDUAnalysisText.insert('end', '上层协议类型：' + str(choosedPacket[Ether].ptype) + '\n')
        self.PDUAnalysisText.insert('end', '数据：' + str(choosedPacket[Ether].payload) + '\n')
        self.PDUCodeText.delete(1.0, END)
        self.PDUCodeText.insert('end', hexdump(choosedPacket, dump=True))

app = Application()
app.mainloop()
