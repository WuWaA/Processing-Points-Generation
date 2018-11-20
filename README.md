# Processing-Points-Generation
Generate points based on functions by Processing

使用Processing基于多个函数生成点

## General 基本说明
Processing setting origin point at top left by default
In this project I changed it to the bottom left by flip Y axis
(you can see this in code)

Processing默认将原点设置在左上角
这个项目里我把Y轴翻转了，于是原点变为左下
详见代码

## The First Function 第一个函数
[First Function]:https://github.com/WuWaA/Processing-Points-Generation/raw/master/function%201.png

The first function based on distance to the original point
More close to the origin, random points more likely to be generated

第一个函数基于到原点的距离
距离原点越近，随机点越有可能被生成并显示出来

## The Second Function 第二个函数
[Second Function]:https://github.com/WuWaA/Processing-Points-Generation/raw/master/function%202.png

The first function based on distance to the diagonal line
More close to the diagonal, random points more likely to be generated

第二个函数基于到对角线的距离
距离对角线越近，随机点越有可能被生成并显示出来

[Second Function With Slope]https://github.com/WuWaA/Processing-Points-Generation/raw/master/function%202%20slope.png

The second function has a slope which could be modify
When 'slope' set to '1', it means diagonal line

因为是到直线的距离，所以直线的斜率可以改变，我在代码里面把它单拎出来了
将'slope'设置为'1'的时候表示对角线

## Combine two functions 组合两个函数
[Two Functions]https://github.com/WuWaA/Processing-Points-Generation/raw/master/function%20both.png
[Two Functions With Slope]https://github.com/WuWaA/Processing-Points-Generation/raw/master/function%20both%20slope.png
[Two Functions With Slope]https://github.com/WuWaA/Processing-Points-Generation/raw/master/function%20both%20slope%202.png

Functions could be combined, and amount of points could be controlled easily
I use 'probability' to control weight of each function, it can be changed by multiply a number such as 0.5 (and will casue half weight of that function)
After change weight, the 'threshold' should be changed
You can find detailed comment in the project file
Hopes that can help

多个函数可以组合起来，每个函数的生成权重使用单独的'probability'来控制
如果乘以一个数（例如0.5，权重减半）就可以直接改变特定函数的权重
之后适当更改阈值'threshold'就可以了
更多内容相见注释