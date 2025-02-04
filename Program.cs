// See https://aka.ms/new-console-template for more information
using CsharpInterview.WorkOutAbstractClass;
using CsharpInterview.WorkOutMethodHiding;
using CsharpInterview.WorkOutOverriding;
using System.Net.Http.Headers;

Console.WriteLine("Hello, World!");


SecondChildAbstractClass objChildAbstractClass = new SecondChildAbstractClass();
Console.WriteLine("value--" + AbstractClass.first.ToString());

Console.WriteLine("----------------------------------------" );


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
