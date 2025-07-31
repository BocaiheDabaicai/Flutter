## Flutter

---

#### 序章

##### 1. Flutter简介

flutter是一种UI框架，独立的编程语言，可以生成多种平台下的代码

##### 2. 环境配置（中国区超难点）【IDEA配置】

- 下载flutter sdk，并放到C盘根目录下，以免一些文件夹因为权限原因而无法访问

- 在path中配置{flutter_sdk}\bin路径

- 在系统变量当中配置中国区代理【一共两条】

- 在`powershell`中输入指令`flutter doctor`，观察安装情况

- 新建项目，并使用`flutter run`指令
  
  - web端，不要使用`edge`，无法执行`r`指令进行界面重载
  
  - android端，下载好官网对应的配置之后，根据自身的开发环境进行配置，不要花费多余的力气去`android studio`上安装配置【`IDEA`在`setting`上可以进行配置】
  
  - window端，就使用`visual studio installer`去修改、或者新增的时候，补充好一个配件`使用c++开发的桌面应用`

- 开发应用，使用`debug`模式，注意选择对应的运行源，可以自动开始热重载，如果有问题，参照官网文件

---

#### 第一章 构建骰子项目

##### 1. 代码

项目会从解析`lib`下的`main.dart`代码开始，自顶向下解析，再被编译成各种平台下都能被识别的代码，最后在选定的平台下进行运行

##### 2. 函数

函数有两种使用参数的方式，第一种是直接写参数，第二种是对象参数

- 直接写参数

参数是必要的，没有传参会报错，可以通过`[]`号包裹参数，使其变为可传值

```dart
void add(a,[b]){} // 设置可传值
void add(a,[b = 5]) // 设置可传值，且默认值为5
```

- 对象参数

参数都是可传值，如果没有传参，那么该形式参数的值为`null`，同时可以改变值传入的顺序，可以设置必传值，可以设置默认值

```dart
void add({a,b = 5}) // 设置默认值
void add({a,required b}) // 设置必传值

add({b:5}) // 传入参数
```

> 参数可以补充类型，例如：`void add(int a)`

##### 3. 基本数据类型

| 名称     | 内容  | 补充       |
| ------ | --- | -------- |
| int    | 整型  |          |
| double | 浮点型 |          |
| num    | 数字型 | 包括整数与浮点数 |
| String | 字符串 |          |
| bool   | 布尔值 |          |
| object | 对象  |          |
| List   | 数组  |          |

#### 4. 补充

🍕`main`函数只有一个，会自动执行

🍕`runApp()`函数用于表示展示什么类型的界面结构

🍕构建的整个过程就是组合和使用多个小组件实现的

🍕函数命名：

- 位置性：`add(a,b)`

- 命名性：`add({a,b})`，命名为`a,b`

- 可选命名：`add(a,[b = 5])`，附默认值，`b`可有可无

- 必要命名：`add({required a,b})`，`a`是必要的

🍕关键字

- `const`：有助于让变量持续性存储，以便于不断被使用，同时避免数据重复

🍕数据类型，每个数据都有一个确定的类型，同时可能存在继承数据类型

- 类型，`int,double,num(整型和浮点型),string,bool,Object`

🍕组件都是一个对象，而每一个对象都是基于类来进行构建

🍕添加外部资源，新建文件夹`assets`，名字不限，主要是存放资源文件

- 同时还需要在`pubspec.yaml`里添加资源路径，才可以引用

🍕函数

- 匿名函数：`onPressd:(){}`

- 定义函数：有名字的函数

🍕组件状态

- 无状态组件：`statelessWedget`

- 有状态组件：`statefulWedget`，使用两个类实现状态更新，同时私有类中使用`setstate`方法进行状态更新

🍕已有库

- 数学库：`dart:math`

---

## 第二章 问答题项目

#### 1. 注意事项

- 新建`.dart`文件，字母全部小写，单词之间使用`_`进行隔开

- 类名单词开头字母大写，每个单词之间不隔开
  
  - 每个类都有一个对应名称的对象，并为它提供`key`值
  
  - 同时拥有`Widget build(){}`函数，返回对应的组件
  
  - 有状态组件命名【这两个类都需要在方法函数前添加`@override`标识】
    
    - 原本类命名`xxx extends StatefulWidget`，原本类添加方法`State<XXX> createState(){ return _XXXState(); }`，添加`key`关键字，`const xxx({super.key}); // 特别要记得加分号`
    
    - 状态组件命名`_XXXState extends State<XXX>`，同时添加`Widget build(){}`方法

- 避免使用组件`Opacity()`，因为这个组件不必要使用，同时不适合构建中大型APP去使用

- 创建类的时候会提供一个同名的类型

#### 2. 概念

- 条件渲染，动态切换渲染的组件，主要是通过在`setState`方法中，对绑定的状态组件进行切换，以此达到切换界面上的组件内容

- 状态提升，由父类掌管状态，并将状态改变的方法传递给子类进行使用

#### 3. 数据模型

- 添加数据模型，一般那是在`lib/models`下进行添加，添加的是纯类，不需要继承其他的类，只需要表示好必要的数据类型

例如：

```dart
class QuizQuestion {
  const QuizQuestion(this.text,this.answers);

  final String text;
  final List<String> answers;
}
```

- 添加静态数据，一般是在`lib/data`中进行添加，添加静态对象。

例如：

```dart
import '../models/quiz_question.dart';

const questions = [
  QuizQuestion(
    'What are the main building blocks of Flutter UIs?',
    [
      'Widgets',
      'Components',
      'Blocks',
      'Functions',
    ],
  ),  // ...
```

- 添加数据模型方法

```dart
List<String> getShuffledAnswers() {
    final shuffleList = List.of(answers);
    shuffleList.shuffle();
    return shuffleList;
  }
```

#### 4. 数组方法

- `map`，不会改变原始数组，但会返回一个新数组，示例：`currentQuestion.answers.map((answer){  
    return AnswerButton(onTap: (){},answerText: answer,);  
  }),`
  
  - 在组件代码中使用时，要对其进行解构`...<List>`

- `shuffle`，对现有的数组进行顺序打乱

- `List.of(<List>)`，复制一个数组并返回

- `where`，不改变原始数组，返回一个新的数组

#### 5.  其他

- 引入外部字体，在`pub.dev`中引入`google`字体，参考API

- 对`for`函数的应用
  
  - 设置`map`类型，定义`List<Map<String,object>>`类型，为该数据赋值，同时使用`for`函数
  
  如下：
  
  ```dart
  List<Map<String, Object>> getSummaryData() {
      final List<Map<String, Object>> summary = [];
  
      for (var i = 0; i < chosenAnswers.length; i++) {
        summary.add({
          'question_index':i+1,
          'question':questions[i].text,
          'question_answer':questions[i].answers[0],
          'question_chosen':chosenAnswers[i],
        });
      }
  
      return summary;
    }
  ```

- `SingleChildScrollView`，滚动视窗，由上级组件决定宽度大小

- `get xxx{... return xxx}`函数，能够在调用函数的时候，直接通过输入`xxx`来获得函数结果
