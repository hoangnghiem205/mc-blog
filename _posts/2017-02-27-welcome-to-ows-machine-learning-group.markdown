---
layout: post
title:  "Welcome to OWS - Machine Learning Group!"
date:   2017-02-27 11:52:14 +0700
categories: jekyll update
use_math: true
---

Website này sẽ là nơi để các thành viên trong Nhóm Học Máy của OWS chia sẻ kiến thức bổ ích về Học Máy, đồng thời cũng sẽ public các kết quả nghiên cứu của các thành viên trong quá trình làm việc.

Để bắt đầu chúng ta sẽ cần có một số hướng dẫn nhỏ để sử dụng Website này.

* Chúng ta sẽ sử dụng `markdown` để soạn thảo bài viết.

* Các bạn có thể sử dụng trích dẫn code trong bài viết

```python
>>> def fib(n):
>>>     a, b = 0, 1
>>>     while a < n:
>>>         print(a, end=' ')
>>>         a, b = b, a+b
>>>     print()
>>> fib(1000)
```

* Có thể `highlight` để nhấn mạnh từ nào đó trong câu. 
* Có thể chèn các công thức toán học vào bài viết theo cú pháp của `LaTeX`

$$
\begin{align*}
  & \phi(x,y) = \phi \left(\sum_{i=1}^n x_ie_i, \sum_{j=1}^n y_je_j \right)
  = \sum_{i=1}^n \sum_{j=1}^n x_i y_j \phi(e_i, e_j) = \\
  & (x_1, \ldots, x_n) \left( \begin{array}{ccc}
      \phi(e_1, e_1) & \cdots & \phi(e_1, e_n) \\
      \vdots & \ddots & \vdots \\
      \phi(e_n, e_1) & \cdots & \phi(e_n, e_n)
    \end{array} \right)
  \left( \begin{array}{c}
      y_1 \\
      \vdots \\
      y_n
    \end{array} \right)
\end{align*}
$$

* Chèn công thức toán ngay trên dòng $$f(x) = a{x^3} + b{x^2} + cx + d$$ , $$ \delta = b^2 - 4ac $$

* Chèn các thành phần đặc biệt khác như `link` `image` `video` có thể xem chi tiết [tại đây](https://kramdown.gettalong.org/quickref.html)
