using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CsharpInterview.WorkOutLiskov.Abstracts
{
    public abstract class BankAccount
    {
        public abstract void Deposit(decimal amount);
    }
}
