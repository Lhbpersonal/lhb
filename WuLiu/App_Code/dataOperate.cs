﻿using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

/// <summary>
/// dataOperate 的摘要说明
/// </summary>
public class dataOperate
{
    public static SqlConnection con;
	public dataOperate()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    //执行添加删除修改
    public static bool execSQL(string sql)
    {
        SqlConnection con = createCon();
        con.Open();
        SqlCommand com = new SqlCommand(sql, con);
        try
        {
            com.ExecuteNonQuery();//返回受影响数
            con.Close();
        }
        catch (Exception e)
        {
            con.Close();
            return false;
        }
        return true;
    }
    //查找是否存在
    public static bool seleSQL(string sql)
    {
        int i;
        SqlConnection con = createCon();
        con.Open();
        SqlCommand com = new SqlCommand(sql, con);//执行sql语句
        try
        {
            i =Convert.ToInt32(com.ExecuteScalar());
            con.Close();
        }
        catch (Exception e)
        {
            con.Close();
            return false;
        }
        //大于0存在
        if (i > 0)//查找到数据
        {
            return true;
        }
        else
        {
            return false;
        }

    }
    //查找并返回多行数据
    public static DataSet getDataset(string sql,string table)
    {
        
        SqlConnection con = createCon();//创建数据库链接
        con.Open();
        DataSet ds;
        
            SqlDataAdapter sda = new SqlDataAdapter(sql, con);//执行sql语句
            ds = new DataSet();
            sda.Fill(ds, table);//填充到ds
            return ds;
          
        //return ds;

    }
    //查找并返回一条数据
    public static SqlDataReader getRow(string sql)
    {
        SqlConnection con = createCon();
        con.Open();
        SqlCommand com = new SqlCommand(sql, con);
        return  com.ExecuteReader();
         

    }
    //连接数据库
    public static SqlConnection createCon()
    {        
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConStr"].ToString());
        return con;
    }
}
