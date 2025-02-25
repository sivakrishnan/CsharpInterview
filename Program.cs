// See https://aka.ms/new-console-template for more information
using CsharpInterview;
using CsharpInterview.LogicalProgam;
using CsharpInterview.ToListVsToArray;
using CsharpInterview.WorkOutAbstractClass;
using CsharpInterview.WorkOutBasicSingleton;
using CsharpInterview.WorkOutClassHierarchy;
using CsharpInterview.WorkOutFunc;
using CsharpInterview.WorkOutMethodHiding;
using CsharpInterview.WorkOutOutKeyword;
using CsharpInterview.WorkOutOverriding;
using CsharpInterview.WorkOutRefKeyword;

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


MethodOverridingBaseClass bOverride1 = new MethodOverridingDerivedClass();
((MethodOverridingDerivedClass)bOverride1).print();



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
int at = 20;
Multiply(ref at);
Console.WriteLine(at);

static void Multiply(ref int number)
{
    number*=2;
}

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

OuterClass.InnerClass inner = new OuterClass.InnerClass();
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

string logicalInput1 = "abbcccddddeeeee";
LogicalPrograms objLogical1 = new LogicalPrograms(logicalInput1);
objLogical1.NumberOfOccurenceOfEachChar();

LogicalPrograms objLogical2 = new LogicalPrograms();
objLogical2.SumOfArrayElements();



Console.WriteLine("---------------veni test-----------------------");
Parent P = new Parent();

P.Print();

Child P1 = new Child();

P1.Print();

Console.WriteLine("-------------ToArray vs ToList-----------------");
ToListVsToArrays obj = new ToListVsToArrays();
obj.SomeCheck();

int[] arrayNumbers = { 1, 2, 3, 4, 5 };
var query = from num in arrayNumbers
            where num%2==0
            select num;
arrayNumbers=arrayNumbers.Append(6).ToArray();
Console.WriteLine("After filter and append one value count={0}", query.Count());

Console.WriteLine("-------------Deferred Execution-----------------");

List<int> numbersDeferred = new List<int> { 1, 2, 3, 4, 5 };
var query1 = numbersDeferred.Where(n => n>2);
numbersDeferred.Add(45);
foreach (var number in query1)
{
    Console.WriteLine(number);
}

Console.WriteLine("-------------Immediate Execution-----------------");

List<int> numbersImmediate = new List<int> { 1, 2, 3, 4, 5 };
var query1Immediate = numbersImmediate.Where(n => n>2).ToList();
numbersImmediate.Add(45);
foreach (var number in query1Immediate)
{
    Console.WriteLine(number);
}


Console.WriteLine("-------------Func vs Action vs Predicate Workout-----------------");

FuncCheck objFunc = new FuncCheck();
objFunc.FuncWithTwoParameter();