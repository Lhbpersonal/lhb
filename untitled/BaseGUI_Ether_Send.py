from tkinter import *
from scapy.all import *
from scapy.layers.l2 import Ether
import tkinter.messagebox as messagebox
#实例化Frame，建立窗口对象window

window = Tk()
#设置窗口标题
window.title('GUI 报文分析器/编辑器')
#设置窗口的大小（长*宽）
window.geometry('700x500')

desMac = StringVar(value='FF:FF:FF:FF:FF:FF')#将Label标签的内容设置为字符类型，用var来接收用户输入的目的desMac
payLoad = StringVar(value='12345678')#将Label标签的内容设置为字符类型，用var来接收用户输入的目的payload
count = StringVar(value='3')#将Label标签的内容设置为字符类型，用var来接收用户输入的发送数据帧的个数

#在window主窗口的界面上设定目的Mac地址标签
desMacLabel = Label(window,text='请输入目的Mac地址:',font=('Arial',12))
#显示标签
desMacLabel.pack()#Label内容content区域放置位置，自动调节尺寸
desMacLabel.place(x=50,y=50)

#在window主窗体的界面上设定payload标签
payloadLabel = Label(window,text='请输入payload:',font=('Arial',12))
#显示标签
payloadLabel.pack()#Label内容content取悦放置位置，自动调节尺寸
payloadLabel.place(x=50,y=120)

#在window主窗体的界面上设定count标签
intLabel = Label(window,text='请输入待发送的报文数',font=('Arial',12))
#显示标签
intLabel.pack()
intLabel.place(x=50,y=160)

#在window主窗体的界面上设定目的Mac地址文本框
desMacEntry = Entry(window,show=None,textvariable=desMac,font=('Arial',14))#显示成明文形式
desMacEntry.pack()
desMacEntry.place(x=200,y=85)

#在window主窗体界面上设定payload值的文本框
payloadEntry = Entry(window,show=None,textvariable=payLoad,font=('Arial',14))#显示成明文形式
payloadEntry.pack()
payloadEntry.place(x=200,y=120)

#在window主窗体的界面上设定count值的文本框
countEntry = Entry(window,show=None,textvariable=count,font=('Arial',14))#显示成明文形式
countEntry.pack()
countEntry.place(x=200,y=160)

def sendEntherFrame():
    desMac = desMacEntry.get()
    payLoad = payloadEntry.get()
    count = countEntry.get()
    messagebox.showinfo('Message','待发送：目的MAC地址是 %s 的帧'% desMac)
    try:
        etherFrame = Ether(dst=desMac) / payLoad
        etherFrameInfoStr = '待发送帧信息\n' + \
            'des:'+desMac + '\n' + \
            'src'+etherFrame.src + '\n' + \
            'payload' + payLoad + '\n'
        resultText.insert('end',etherFrame)
        resultText.insert('end',str(etherFrame) + '\n')
        #在多行文本框text中显示发送帧的信息
        for i in range(int(count)):
            sendp(etherFrame)
            resultText.insert('end','成功发送第'+str(i)+'个以太帧。\n')
    except ValueError as e:
        resultText.insert('end','赋值异常\n'+str(e)+'\n')
    except Exception as e:
        resultText.insert('end','发送数据失败\n'+str(e)+'\n')
    finally:
        pass

#在窗口界面设置放置Button按钮
sendbnt = Button(window,text='发送',font=('Arial',12),width=10,height=1,command=sendEntherFrame)
sendbnt.pack()
sendbnt.place(x=245,y=200)

#创建并放置一个多行文本框text用以显示，指定height=5位文本框是三个字符高度，width=459
#将文本框关联到滚动提哦啊上，滚动条华东，文本框跟随滑动
resultTextFrame = Frame(window)
resultText = Text(resultTextFrame,height=20)
#创建一个纵向滑动的滚动条，铺满Y方向
s1 = Scrollbar(resultTextFrame,orient=VERTICAL)
#HORIZONTAL设置水平方向滚动条，默认是竖直
s2 = Scrollbar(resultTextFrame,orient=HORIZONTAL)
s1.pack(side=RIGHT,fill=Y)
s2.pack(side=BOTTOM,fill=X)
s1.config(command=resultText.yview)
s2.config(command=resultText.xview)
resultText['yscrollcommand'] = s1.set
resultText['xscrollcommand'] = s2.set
resultText.pack(side=LEFT,fill=BOTH)
#resultTextFrame.place(x=10,y=260)
resultTextFrame.pack(side=BOTTOM,fill=Y)
window.mainloop()