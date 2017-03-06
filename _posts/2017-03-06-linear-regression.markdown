---
layout: post
title: "Linear Regression (hồi quy tuyến tính)"
date:   2017-03-06 11:32:17 +0700
categories: jekyll update
use_math: true
---

* write content here
Trong các mô hình `regression` (các mô hình giải quyết bài toán dự đoán kết quả từ đầu vào chưa biết từ trước), `linear regression` là thuật toán đơn giản nhất trong mô hình này.

Một ví dụ đơn giản về dạng bài toán mà thuật toán này giải quyết là ví dụ về dự đoán giá của một căn nhà dựa vào các thông tin như vị trí, diện tích, số phòng,... của căn nhà đó. Giả sử chúng ta có dữ liệu của 1000 căn nhà, cần đoán giá một căn nhà có diện tích $$\mathbf{x_1} m^2$$, có $$\mathbf{x_2}$$ phòng, cách trung tâm $$\mathbf{x_3} km$$ cách đơn giản nhất có thể nghĩ đến trong trường hợp này là linear regression. Giả sử tồn tại hàm dự đoán $$y = f(\mathbf{x})$$ trong đó $$\mathbf{x} = [x_1, x_2, x_3]$$ là vector biểu diễn thông tin **input**, $$y$$ là vô hướng thể hiện **output** trong trường hợp này là giá trị ngôi nhà.

Một cách đơn giản ta có thể nhận thấy:
- Ngôi nhà càng lớn giá càng cao.
- Ngôi nhà càng nhiều phòng giá càng cao.
- Ngôi nhà càng gần trung tâm giá càng cao.

Các phụ thuộc này độc lập nhau, một cách đơn giản có thể biểu diễn bằng một hàm tuyến tính

$$
\begin{align*}
&\quad\quad\quad\quad\quad y \approx f(\mathbf{x}) = \hat{y} \newline
& f(\mathbf{x}) = w_1x_1 + w_2x_2 + w_3x_3 + w_0 \quad(1)
\end{align*}
$$

Mối quan hệ $$y\approx f(\mathbf{x})$$ bên trên là mối quan hệ tuyến tính, bài toán cần giải quyết là đi tìm các hệ số $$\{w_1, w_2, w_3, w_0\}$$ sao cho giá trị $$y$$ gần với $$\hat{y}$$ (kết quả dự đoán của mô hình hồi quy tuyến tính) nhất có thể.

Trong phương trình (1) ở trên, đặt $$\mathbf{w} = [w_0, w_1, w_2, w_3]^T$$ là vector (cột) hệ số cần phải tối ưu, $$\bar{\mathbf{x}} = [1,x_1,x_2,x_3]$$ là vector (hàng) dữ liệu đầu vào (số 1 được thêm vào để đơn giản hóa việc tính hệ số $$w_0$$). Khi đó (1) trở thành:

$$
\begin{align*}
& y \approx \bar{\mathbf{x}}\mathbf{w} = \hat{y}
\end{align*}
$$

Từ phương trình trên, ta đi tìm sai số dự đoán của mô hình linear regression. Đối với một điểm dữ liệu $$\mathbf{x}$$, sai số được xác định bằng sai khác giữa giá trị thực $$y$$ với giá trị dự đoán $$\hat{y}$$, gọi giá trị này là $$e$$. Để mô hình đạt hiệu quả cao, người ta mong muốn giá trị $$e$$ này càng nhỏ càng tốt, hay nói cách khác giá trị sau càng nhỏ càng tốt:

$$
\begin{align*}
& \frac{1}{2}e^2 = \frac{1}{2}(y-\hat{y}) = \frac{1}{2}(y-\bar{\mathbf{x}}\mathbf{w})^2
\end{align*}
$$

Khi đó nếu xét trên toàn tập dữ liệu đã gán nhãn (thường gọi là dữ liệu training) giả sử có $$N$$ điểm dữ liệu đã được đánh nhãn $$(\mathbf{x}_i,y_i), i = 1,2,...,N$$, sai số tính trên toàn tập dữ liệu mẫu sẽ là:

$$
\begin{align*}
& \frac{1}{2}\sum_{i=1}^N{(y_i - \bar{\mathbf{x}}_i\mathbf{w})^2} = \frac{1}{2} \|\mathbf{y} - \mathbf{\bar{X}}\mathbf{w} \|_2^2 \quad(2)
\end{align*}
$$

Biểu thức vế phải (2) được gọi là hàm mất mát, kí hiệu $$\mathcal{L}(\mathbf{w})$$. Chúng ta sẽ đi giải tìm vector $$\mathbf{w}$$ thỏa mãn hàm $$\mathcal{L}(\mathbf{w})$$ đạt giá trị nhỏ nhất hay nói cách khác là tìm điểm tối ưu cho hàm $$\mathcal{L}(\mathbf{w})$$.

Chú ý trong (2) biểu thức $$\|\mathbf{z}\|_2$$ là khoảng cách Euclid (Euclid norm).

Giải nghiệm tối ưu của $$\mathcal{L}(\mathbf{w})$$, cách đơn giản nhất được sử dụng là đạo hàm bằng 0, cách này khả thi do hàm $$\mathcal{L}(\mathbf{w})$$ có đạo hàm tại mọi điểm. Ta có đạo hàm theo $$\mathbf{w}$$ của hàm mất mát (bạn đọc tự đạo hàm):

$$
\begin{align*}
\frac{\partial{\mathcal{L}(\mathbf{w})}}{\partial{\mathbf{w}}}
= \mathbf{\bar{X}}^T(\mathbf{\bar{X}}\mathbf{w} - \mathbf{y})
\end{align*}
$$

Phương trình đạo hàm bằng 0 tương đương với:

$$
\begin{align*}
\mathbf{\bar{X}}^T\mathbf{\bar{X}}\mathbf{w} = \mathbf{\bar{X}}^T\mathbf{y} \triangleq \mathbf{b} \quad (3)
\end{align*}
$$

(kí hiệu $$\triangleq \mathbf{b}$$ nghĩa là đặt bằng $$\mathbf{b}$$)

Giải phương trình (3) ta nhân cả 2 vế phương trình với ma trận nghịch đảo $$\mathbf{A}^{-1} \triangleq (\mathbf{\bar{X}}^T\mathbf{\bar{X}})^{-1}$$. Tuy nhiên do các điều kiện ràng buộc để tồn tại ma trận nghịch đảo khá nghiêm ngặt làm cho bài toán khó giải quyết trong nhiều trường hợp, chúng ta sử dụng khái niệm **giả nghịch đảo** để tính $$\mathbf{w}$$ trong trường hợp này, kí hiệu giả nghịch đảo là $$\mathbf{A}^{\dagger}$$. Khi đó điểm tối ưu của bài toán Linear Regression có dạng:

$$
\begin{align*}
\mathbf{w} = \mathbf{A}^{\dagger}\mathbf{b} = (\mathbf{\bar{X}}^T\mathbf{\bar{X}})^{\dagger} \mathbf{\bar{X}}^T\mathbf{y} \quad (4)
\end{align*}
$$

Biểu diễn với Python

Bài toán đặt ra: với đầu vào là chiều cao của một người, hãy dự đoán cân nặng của người đó.
Trong bài toán này, dữ liệu chỉ có 1 chiều để thuận tiện cho việc mô tả trong mặt phẳng.

Ta có bảng dữ liệu mẫu là chiều cao và cân nặng tương ứng của 15 người:

|Chiều cao \(cm\) | Cân nặng \(kg\) | Chiều cao \(cm\) | Cân nặng \(kg\) |
| :---: | :---: | :---: | :---: |
| 147 | 49 | 168 | 60 |
| 150 | 50 | 170 | 72 |
| 153 | 51 | 173 | 63 |
| 155 | 52 | 175 | 64 |
| 158 | 54 | 178 | 66 |
| 160 | 56 | 180 | 67 |
| 163 | 58 | 183 | 68 |
| 165 | 59 | | |

Nhận xét một cách tương đôi chiều cao và cân nặng có tỉ lệ thuận với nhau (càng cao thì càng nặng) do đó có thể sử dụng linear regression để giải quyết bài toán này. Thep phương pháp kiểm thử, ta sẽ giữ lại 1 phần dữ liệu để kiểm tra tính đúng đắn của bộ $$\mathbf{w}$$ tìm được, ở đây ta giữ lại dòng 155 và 160 cm, các dòng còn lại được dùng làm dữ liệu mẫu cho training.

Hiển thị dữ liệu trên đồ thi

```python
from __future__ import division, print_function, unicode_literals
import numpy as np      # thư viện đại số của python
import matplotlib.pyplot as plt # thư viện dùng vẽ đồ thị

# khai báo và biểu diễn dữ liệu lên đồ thị
# height (cm)
X = np.array([[147, 150, 153, 158, 163, 165, 168, 170, 173, 175, 178, 180, 183]]).T
# weight (kg)
y = np.array([[ 49, 50, 51,  54, 58, 59, 60, 62, 63, 64, 66, 67, 68]]).T
# Visualize data 
plt.plot(X, y, 'ro')
plt.axis([140, 190, 45, 75])
plt.xlabel('Height (cm)')
plt.ylabel('Weight (kg)')
plt.show()
```

![gras](http://machinelearningcoban.com/assets/LR/output_3_0.png)

Đồ thị cho thấy dữ liệu được sắp xếp dạng tuyến tính do đó Linear Regression sẽ cho kết quả tốt.
Theo công thức (4) ta tính vector hệ số $$\mathbf{w}$$.

```python
# Building Xbar 
one = np.ones((X.shape[0], 1))
Xbar = np.concatenate((one, X), axis = 1)

# Calculating weights of the fitting line 
A = np.dot(Xbar.T, Xbar)
b = np.dot(Xbar.T, y)
w = np.dot(np.linalg.pinv(A), b) 
# với np.linalg.pinv(A) là giả nghịch đảo của ma trận A
print('w = ', w)
# Preparing the fitting line 
w_0 = w[0][0]
w_1 = w[1][0]
x0 = np.linspace(145, 185, 2)
# công thức tuyến tính của cân nặng theo chiều cao
y0 = w_0 + w_1*x0

# Drawing the fitting line 
plt.plot(X.T, y.T, 'ro')     # data 
plt.plot(x0, y0)               # the fitting line
plt.axis([140, 190, 45, 75])
plt.xlabel('Height (cm)')
plt.ylabel('Weight (kg)')
plt.show()
```

Kết quả
```python
w =  [[-33.73541021]
 [  0.55920496]]
```

![gras](http://machinelearningcoban.com/assets/LR/output_5_1.png)

Từ đồ thị ta thấy dữ liệu nằm khá gần đường dự đoán, vậy mô hình Linear Regression hoạt động tốt trên tập training này.
Thử với 2 giá trị chiều cao 155 và 160 cm.

```python
y1 = w_1*155 + w_0
y2 = w_1*160 + w_0

print( u'Predict weight of person with height 155 cm: %.2f (kg), real number: 52 (kg)'  %(y1) )
print( u'Predict weight of person with height 160 cm: %.2f (kg), real number: 56 (kg)'  %(y2) )
```

```python
Predict weight of person with height 155 cm: 52.94 (kg), real number: 52 (kg)
Predict weight of person with height 160 cm: 55.74 (kg), real number: 56 (kg)
```

Ta thấy kết quả khá gần với tính toán.

Sử dụng thư viện scikit-learn thử nghiệm Linear Regression

```python
from sklearn import datasets, linear_model

# fit the model by Linear Regression
regr = linear_model.LinearRegression(fit_intercept=False) # fit_intercept = False for calculating the bias
regr.fit(Xbar, y)

# Compare two results
print( 'Solution found by scikit-learn  : ', regr.coef_ )
print( 'Solution found by (4): ', w.T)
```

```python
    Solution found by scikit-learn  :  [[  -33.73541021 0.55920496]]
    Solution found by (4):  [[  -33.73541021 0.55920496 ]]
```

Kết quả thu được như nhau :))

Phần bổ sung:

Hạn chế của Linear Regression

Linear regression khá *nhạy cảm với nhiễu* nghĩa là khi trong tập training có các điểm dữ liệu nằm ở vị trí không tuyến tính hay gần tuyến tính với các điểm dữ liệu khác sẽ khiến cho hàm $$f(\mathbf{x})$$ của linear sai khác đi rất nhiều.

![gras](http://machinelearningcoban.com/assets/LR/output_13_1.png)

Do đó trước khi thực hiện linear regression cần có bước *lọc nhiễu* loại bỏ các điểm dữ liệu cá biệt này.

Mặt khác từ trên ta nhận thấy, dữ liệu chuẩn để đạt kết quả tốt khi sử dụng linear regression là dữ liệu mà bản thân nó có dạng tuyến tính hay gần tuyến tính. Đây cũng là hạn chế lớn của linear regression, tuy nhiên có thể nâng bậc của hàm tuyến tính $$f(\mathbf{x})$$ để tăng độ chính xác của linear regression.

Phương pháp nâng bậc phương trình tuyến tính của Linear Regression

Nhận thấy hàm số $$y \approx f(\mathbf{x})= \mathbf{w}^T\mathbf{x}$$ của Linear Regression là một hàm tuyến tính theo cả $$\mathbf{w}$$ và $$\mathbf{x}$$ do đó hàm số sau vẫn có thể được sử dụng để tính toán trong mô hình này:

$$
\begin{align*}
y \approx w_1 x_1 + w_2 x_2 + w_3 x_1^2 + w_4 \sin(x_2) + w_5 x_1x_2 + w_0
\end{align*}
$$

Rõ ràng khi xét đối với biến là $$\mathbf{x}$$ hàm số trên không chỉ đơn giản là dạng phẳng thuần nhưng vẫn đảm bảo tuyến tính đối với $$\mathbf{w}$$ do đó vẫn áp dụng được phương pháp trên.
Tuy nhiên hạn chế của phương pháp này là khiến việc tối ưu hàm mất mát trở nên phức tạp hơn. Ở các bài sau, chúng ta sẽ có các phương pháp khác hiệu quả hơn với trường hợp các dữ liệu đầu vào không thích hợp cho linear regression.
