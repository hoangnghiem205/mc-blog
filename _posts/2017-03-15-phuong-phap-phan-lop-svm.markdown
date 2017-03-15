---
layout: post
title: "Phương Pháp Phân Lớp SVM"
date:   2017-03-15 09:35:22 +0700
categories: jekyll update
use_math: true
---

SVM là mô hình toán học sử dụng để phân lớp dữ liệu, nó được xếp vào nhóm các thuật toán Học Có Giám Sát. SVM được sử dụng khá phổ biến trong Machine Learning, một số bài toán sử dụng SVM như: bài toán phân loại chữ viết tay \(OCR\), bài toán phân biệt các loại hoa, quả dựa vào một số đặc điểm như màu sắc, kích thước, mùi vị, ... bài toán phân loại chủ để của bài viết, website,...

## SVM làm việc như thế nào

Ý tưởng chính của thuật toán SVM cũng giống như các thuật toán phân lớp khác là xây dựng một siêu phẳng để phân chia vùng dữ liệu thành 2 lớp riêng biệt và tối thiểu hoá hàm mất mát dữ liệu.

Thuật toán SVM được chia thành 2 loại dựa trên đặc tính của tập dữ liệu đầu vào, đó là:

1. Phân lớp SVM tuyến tính
2. Phân lớp SVM phi tuyến

Để đơn giản, ta xét bài toán Phân lớp SVM tuyến tính trước.

## Phân lớp SVM tuyến tính

Với bài toán này, tập dữ liệu ban đầu cung cấp cho thuật toán phải đảm bảo được tiêu chí là tuyến tính, tức là có thể sử dụng 1 đường thẳng \( trong không gian 2 chiều \), 1 mặt phẳng \( trong không gian 3 chiều \) hay 1 siêu phẳng \( trong không gian &gt; 3 chiều \) để phân chia tập dữ liệu ra thành 2 phần riêng biệt.

![](/assets/images/a.png)

Trong trường hợp này ta thấy, đường H1 và H2 thoả mãn điều kiện chia tập dữ liệu thành 2 phần riêng biệt, còn đường H1 thì không thoả mãn. Vấn đề là ta sẽ chọn đường nào trong 2 đường H1 và H2, trên thực tế không chỉ có 2 đường này thoả mãn mà còn rất nhiều đương khác cũng thoả mãn điều kiện trên. Vậy chúng ta làm thế nào để chọn đương 1 đường tốt nhất trong các đường thẳng đó? SVM sẽ giúp chúng ta tìm ra nó. Trước khi đi vào tìm hiểu SVM làm thế nào để tìm ra đường thẳng tối ưu nhất để phân chia dữ liệu ta sẽ cần phải biết một số khái niệm.

#### Khoảng cách lề \(margin\)

![](/assets/images/b.png)

Trong hình vẽ, ta thấy dữ liêu sẽ được chia thành 2 nhóm, 1 nhóm được đánh nhãn dương \(+1\) và 1 nhóm còn lại được đánh nhãn âm \(-1\), SVM sẽ giúp ta tìm được 1 **siêu phẳng tách \(Separating Hyperplane\) **để tách 2 nhóm dữ liệu này. Mỗi nhóm dữ liêu sẽ có một đường thẳng \(siêu phẳng\) có thể coi là biên của nhóm dữ liệu đó, đường thẳng \(siêu phẳng\) này sẽ song song với đường thẳng \(siêu phẳng\) tách mà chúng ta cần tìm và khoảng cách từ đường thẳng \(siêu phẳng\) tách đến biên được gọi là **lề \(margin\). **Điểm hay vector nằm trên đường thẳng \(siêu phẳng\) biên sẽ được gọi là** Điểm \(vector\) Hỗ Trợ \(Support Vector\).**

Vậy bài toán của chúng ta là đi tìm 1 siêu phẳng tách tốt nhất giờ se tương đương với việc tìm siêu phẳng sao cho khoẳng cách lê \(margin\) là lớn nhất.

![](/assets/images/c.png)

Giờ câu hỏi đặt ra là, khoảng cách lề được tính như thế nào? Để đơn giản hoá ta xét bài toán trong không gian 2 chiều, các siêu phẳng sẽ trở thành đường thẳng. Giờ chúng ta sẽ có:

![](/assets/images/d.png)

* Đường thẳng tách có phương trình là: $$ \vec{w} \cdot \vec{x} + b = 0$$
* Đường thẳng biên có phương trình lần lượt là: $$ \vec{w} \cdot \vec{x} + b = -1$$ và $$ \vec{w} \cdot \vec{x} + b = 1$$
* Vecto $$\vec{w}$$ là vecto pháp tuyến của *đường thẳng tách*.

Giờ ta gọi khoảng cách lề cần tìm là $$m$$, điểm $$ x_0 $$ nằm trên đường thẳng $$H_0: \vec{w} \cdot \vec{x} + b = -1$$ và Vecto $$ k = m \frac{w}{\left \|w\right \|}$$.

![](/assets/images/e.png)

Dễ thấy, vecto $$x_0 + k$$ sẽ nằm trên đường $$H_1: \vec{w} \cdot \vec{x} + b = 1$$. Ta có


$$
\begin{align*}
w \cdot (x_0 + k) &= 1 \\
w \cdot \left( x_0 + k\frac{w}{\left \|w\right \|} \right) + b &= 1 \\
w \cdot x_0 + b &= 1 - m\left \|w\right \| \\
-1 &= 1 - m\left \|w\right \| \\
m &= \frac{2}{\left \|w\right \|}
\end{align*}
$$


Đến đây, bài toán của chúng ta trông đã có vẻ đơn giản hơn, đó là: *Đi tìm $$ w $$ sao cho giá trị $$\frac{2}{\left \|w \right \|}$$ là lớn nhất*. Nhưng để thuận tiện cho việc giải người ta thường xết bài toán tương đương là: *Đi tìm $$ w $$ sao cho giá trị của $$\frac{1}{2} \left \|w \right \|^2$$ là nhỏ nhất.*

### Giải bài toán tối ưu

Trước khi đi vào giải bài toán tối ưu trên ta phát biểu lại bài toán theo phong cách toán học hơn như sau:


$$
min \frac{1}{2} \left \| w \right \|^2 \\
v.đ.k\quad y_i(w \cdot x_i + b) \geq 1
$$


Để giải bài toán này, ta sẽ sử dụng phương pháp **Nhân tử Lagrange **


$$
\mathcal{L}(w,b,\alpha) = \frac{1}{2}\left \| w \right \|^2 - \sum_{i=1}^m \alpha_i \left [y_i\left ( w \cdot x_i + b\right ) - 1 \right ]
$$


Sử dụng điều kiên **KKT \(Karush-Kuhn-Tucker\)**, ta có


$$
\begin{align*}
\nabla_w\mathcal{L}(w,b,\alpha) &= w - \sum_{i=1}^m \alpha_iy_ix_i = 0 \\
w &= \sum_{i=1}^m \alpha_iy_ix_i = 0 \\
\frac{\partial}{\partial b}\mathcal{L}(w,b,\alpha) &= \sum_{i=1}^m \alpha_i y_i = 0 \\
\end{align*}
$$


Đến đây, chúng ta thấy có thể dễ dàng tìm được $$w$$ nếu biết $$\alpha$$. Để tìm $$\alpha$$ ta giải bài toán đối ngẫu


$$
max_\alpha \quad \sum_{i=1}^m\alpha_i - \frac{1}{2}\sum_{i,j=1}^my_iy_j\alpha_i\alpha_jx^Tx \\
v.đ.k \quad \alpha_i \geq 0, i=1,...,m \\
\sum_{i=1}^m\alpha_iy_i = 0
$$


## Phân lớp SVM Phi tuyến
Từ đầu đến giờ ta đang xét bài toán trên tập dữ liệu lý tưởng là tuyến tính, nhưng trong thực tế các bài toán ta gặp phải phần lớn là phi tuyến. Để giải quyết vấn đề này người ta tìm cách biến đổi tập dữ liệu đầu vào đang là phi tuyến sang một tập dữ liệu khác tương đương nhưng tuyến tính thông qua một **Kernel (Nhân)** $$K$$ thoả mãn

$$
K(x,z) = \phi(x)^T\phi(z)
$$
![](/assets/images/f.png)

Một số **Kernel** cơ bản
* Polynomial: $$K(x,y)=(x \cdot y + 1)^p$$
* Radial Basic Funtion (RBF): $$K(x,y) = exp\left \{ \frac{\left \| x-y \right \|^2}{2\sigma^2} \right \}$$
* Sigmoid: $$K(x,y) = tanh(\beta_0 x \cdot y - \beta_1)$$

## Tổng kết
Trên đây là những kiến thức cơ bản về thuật toán SVM, còn rất nhiều kiến thức và ứng dụng liên quan đến thuật toán này nhưng trong phạm vi bài viết này chưa đề cập đến. Trong các bài viết sau chúng ta sẽ tiếp tục tìm hiểu những vấn đề này.



