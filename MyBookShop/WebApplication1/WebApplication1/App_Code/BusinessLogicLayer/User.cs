using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1.App_Code.BusinessLogicLayer
{
    public class User
    {
        private int _userID;
        private string _loginName;
        private string _userName;
        private string _password;
        private string _address;
        private string _zip;
        private bool _exist;

        public int UserID
        {
            set
            {
                this._userID = value;
            }
            get
            {
                return this.UserID;
            }
        }

        public string LoginName
        {
            set
            {
                this._loginName = value;
            }
            get
            {
                return this._loginName;
            }
        }

        public string Password
        {
            set
            {
                this._password = value;
            }
            get
            {
                return this._password;
            }
        }

        public string Address
        {
            set
            {
                this._password = value;
            }
            get
            {
                return this._password;
            }
        }
    }
}