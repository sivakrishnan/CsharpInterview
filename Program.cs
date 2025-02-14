// See https://aka.ms/new-console-template for more information
using CsharpInterview.LogicalProgam;
using CsharpInterview.WorkOutAbstractClass;
using CsharpInterview.WorkOutBasicSingleton;
using CsharpInterview.WorkOutClassHierarchy;
using CsharpInterview.WorkOutMethodHiding;
using CsharpInterview.WorkOutOutKeyword;
using CsharpInterview.WorkOutOverriding;
using CsharpInterview.WorkOutRefKeyword;
using System.Net.Http.Headers;

Console.WriteLine("Hello, World!");


SecondChildAbstractClass objChildAbstractClass = new SecondChildAbstractClass();
Console.WriteLine("value--" + AbstractClass.first.ToString());

Console.WriteLine("----------------------------------------");


FirstChildAbstractClass objFirstChildAbstractClass = new FirstChildAbstractClass();


Console.WriteLine("----------------Method Overriding------------------------");

MethodOverridingBaseClass b = new MethodOverridingBaseClass();
b.print();

MethodOverridingDerivedClass d = new MethodOverridingDerivedClass();
d.print();
((MethodOverridingBaseClass)d).print();

MethodOverridingBaseClass bOverride = new MethodOverridingDerivedClass();
bOverride.print();



Console.WriteLine("----------------Method Hiding------------------------");

MethodHidingBaseClass bHide = new MethodHidingBaseClass();
bHide.print();

MethodHidingDerivedClass dHide = new MethodHidingDerivedClass();
dHide.print();
((MethodHidingBaseClass)dHide).print();

MethodHidingBaseClass bdHideFinal = new MethodHidingDerivedClass();
bdHideFinal.print();

Console.WriteLine("----------------Ref Keyword------------------------");

int a = 10;


Console.WriteLine($"Before call a value is ={a}");
RefKeyword objRef = new RefKeyword();
objRef.TestRefKeyword(ref a);
Console.WriteLine($"After call a value is={a}");

Console.WriteLine("----------------Out Keyword------------------------");

int outValue = 10;


Console.WriteLine($"Before call a value is ={outValue}");
OutKeyword objOut = new OutKeyword();
objOut.TestOutKeyword(out outValue);
Console.WriteLine($"After call a value is={outValue}");


Console.WriteLine("----------------Array with Multiple Type------------------------");

object[] arrObject = new object[3];

arrObject[0]=1;
arrObject[1]="string";
arrObject[2]=b;

foreach (var type in arrObject)
{
    Console.WriteLine($"value is={type}");
}


Console.WriteLine("----------------Each word in string reverse------------------------");

string inputString = "one two three four five";
string result = string.Join(" ", inputString.Split(' ').Reverse().Select(x => new string(x.Reverse().ToArray())));

Console.WriteLine($"result is={result}");

Console.WriteLine("----------------Class Hierarchy------------------------");

OuterClass outerClass = new OuterClass();
outerClass.outclassfunction();

OuterClass.InnerClass inner=new OuterClass.InnerClass();
inner.innerclassfunction();

Console.WriteLine("----------------Singleton Example-----------------------");

BasicSingleton obj1 = BasicSingleton.GetInstance;
obj1.PrintDetails("basic singleton 1.");

BasicSingleton obj2 = BasicSingleton.GetInstance;
obj2.PrintDetails("basic singleton 2.");


Console.WriteLine("----------------Logical Progam-----------------------");

string logicalInput = "(dafsd{adfsd[abc]}})";
LogicalPrograms objLogical = new LogicalPrograms(logicalInput);
objLogical.CheckOpenCloseBracesProper();
