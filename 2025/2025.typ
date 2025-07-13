// #import "template.typ": *
#import "@preview/ori:0.2.2": *

#set heading(numbering: numbly("{1:一}、", default: "1.1  "))

#show: ori.with(
  title: "定位算法研究笔记",
  author: "作者",
  subject: "研究记录",
  semester: "2025",
  date: datetime.today(),
  // maketitle: true,
  // makeoutline: true,
  // theme: "dark",
  // media: "screen",
)


// 目录
// #pagebreak()
= 旋转与平移
== 固定轴旋转
#proposition[
  // 以旋转以ZXY旋转为例
  step1: *$R_z$* \
  step2: *$R_x$* $ @ R_z$ \
  step3: *$R_y$* $ @ R_x @  R_z$ \
]

== 移动轴旋转
#proposition[
  // 以旋转以ZXY旋转为例
  step1: *$R_y$* \
  step2: $R_y  @ $*$R_x$* \
  step3: $R_y  @ R_x @  $*$R_z$* \
]

#emph-box[
  注：  旋转以ZXY旋转为例
]

== 旋转和平移

#definition()[
  $C_w$ 代表摄像机世界位置 \
  $R = attach(R, tl:c, br:w)$ 移动轴c旋转到w坐标系 \
  $t = attach(t, tl:c, br:w)$ 移动轴c移动到w坐标系 \
  $p_w$ 世界坐标点

]
#proposition()[
  $
    p_c = R @ P_w + t \
    p_c = R @ (P_w - C_w) \

    => C_w = -R^T @ t \
    => t = -R @ C_w \
  $
]

= 多视图

#image("images/Screenshot 2025-07-13 at 11.33.07.png")

== E矩阵

#definition()[
$ 
p_0 = attach(vec(x_0, y_0, 1), tl:C_0)  \
p_1 = attach(vec(x_1, y_1, 1), tl:C_1)  \
l_0 = attach(vec(a_0, b_0, c_0), tl:C_0)  \
// attach(R_c_1, tl:C_0) p_1  \
attach(R_c_1, tl:C_0)   \
attach(t_c_1, tl:C_0)   \
attach(H_c_1, tl:C_0)   \
attach(H_c_1, tl:C_0) = mat(
attach(R_c_1, tl:C_0),   attach(t_c_1, tl:C_0) ;
0,1;

)
$
]

#emph-box[
  注： 向量和起始点没有关系，只和方向和大小有关。
]

#proposition[
$ arrow(P_0C_0) dot (arrow(C_0C_1) times arrow(C_1P_1)) = 0 \
=> p_0 dot (t times R p_1) = 0 \
=> p_0 dot ([t]_× R)p_1 = 0 \
=> p_0^T ([t]_× R)p_1 = 0 \
$
]

#proposition[
$ E = [t]_× R \
  p_0^T l = 0 \
  => p_0^T E p_1 = 0 \
  => l_0 = E p_1
$
]


== F矩阵
#definition()[
  $
    u_0 = K p_0 \
    u_1 = K p_1 \

  $
]
#proposition[
  $
  p_0 = K^(-1) u_0 \
  => p_0^T = (K^(-1) u_0)^T \
  => p_0^T = u_0^T K^(-T) \
  \
  p_1 = K^(-1) u_1 \
  \

  p_0^T ([t]_× R)p_1 = 0 \
  => u_0^T K^(-T) ([t]_× R) K^(-1) u_1 = 0 \
  $
]

#proposition()[
  $
  F = K^(-T) ([t]_× R) K^(-1) \
  u_0^T l = 0 \
  => u_0^T F u_1 = 0 \
  => l_0 = F u_1

  $
]

#emph-box[
    $K_0 = K_1 = K $ \
  注： 假定是同一个相机
]