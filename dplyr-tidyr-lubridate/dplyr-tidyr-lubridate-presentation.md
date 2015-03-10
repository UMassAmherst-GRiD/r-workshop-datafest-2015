Organizing your data with dplyr, tidyr, and lubridate
========================================================
author: Stephen Lauer
date: 3/10/2015

Data Manipulation
========================================================
- Looking at all your data at once is often impossible or confusing. We may only want to look at a part of our data
- In this presentation I will walk you through the packages dplyr, tidyr, and lubridate to help you format your data exactly as you like it
- You can find cheatsheets for dplyr and tidyr at www.rstudio.com/resources/cheatsheets

dplyr - select()
========================================================

To view the columns of your choosing, use select(). Can choose by column name:


```r
library(dplyr)
data("iris")
select(iris,
       Petal.Width,
       Species)
```

```
    Petal.Width    Species
1           0.2     setosa
2           0.2     setosa
3           0.2     setosa
4           0.2     setosa
5           0.2     setosa
6           0.4     setosa
7           0.3     setosa
8           0.2     setosa
9           0.2     setosa
10          0.1     setosa
11          0.2     setosa
12          0.2     setosa
13          0.1     setosa
14          0.1     setosa
15          0.2     setosa
16          0.4     setosa
17          0.4     setosa
18          0.3     setosa
19          0.3     setosa
20          0.3     setosa
21          0.2     setosa
22          0.4     setosa
23          0.2     setosa
24          0.5     setosa
25          0.2     setosa
26          0.2     setosa
27          0.4     setosa
28          0.2     setosa
29          0.2     setosa
30          0.2     setosa
31          0.2     setosa
32          0.4     setosa
33          0.1     setosa
34          0.2     setosa
35          0.2     setosa
36          0.2     setosa
37          0.2     setosa
38          0.1     setosa
39          0.2     setosa
40          0.2     setosa
41          0.3     setosa
42          0.3     setosa
43          0.2     setosa
44          0.6     setosa
45          0.4     setosa
46          0.3     setosa
47          0.2     setosa
48          0.2     setosa
49          0.2     setosa
50          0.2     setosa
51          1.4 versicolor
52          1.5 versicolor
53          1.5 versicolor
54          1.3 versicolor
55          1.5 versicolor
56          1.3 versicolor
57          1.6 versicolor
58          1.0 versicolor
59          1.3 versicolor
60          1.4 versicolor
61          1.0 versicolor
62          1.5 versicolor
63          1.0 versicolor
64          1.4 versicolor
65          1.3 versicolor
66          1.4 versicolor
67          1.5 versicolor
68          1.0 versicolor
69          1.5 versicolor
70          1.1 versicolor
71          1.8 versicolor
72          1.3 versicolor
73          1.5 versicolor
74          1.2 versicolor
75          1.3 versicolor
76          1.4 versicolor
77          1.4 versicolor
78          1.7 versicolor
79          1.5 versicolor
80          1.0 versicolor
81          1.1 versicolor
82          1.0 versicolor
83          1.2 versicolor
84          1.6 versicolor
85          1.5 versicolor
86          1.6 versicolor
87          1.5 versicolor
88          1.3 versicolor
89          1.3 versicolor
90          1.3 versicolor
91          1.2 versicolor
92          1.4 versicolor
93          1.2 versicolor
94          1.0 versicolor
95          1.3 versicolor
96          1.2 versicolor
97          1.3 versicolor
98          1.3 versicolor
99          1.1 versicolor
100         1.3 versicolor
101         2.5  virginica
102         1.9  virginica
103         2.1  virginica
104         1.8  virginica
105         2.2  virginica
106         2.1  virginica
107         1.7  virginica
108         1.8  virginica
109         1.8  virginica
110         2.5  virginica
111         2.0  virginica
112         1.9  virginica
113         2.1  virginica
114         2.0  virginica
115         2.4  virginica
116         2.3  virginica
117         1.8  virginica
118         2.2  virginica
119         2.3  virginica
120         1.5  virginica
121         2.3  virginica
122         2.0  virginica
123         2.0  virginica
124         1.8  virginica
125         2.1  virginica
126         1.8  virginica
127         1.8  virginica
128         1.8  virginica
129         2.1  virginica
130         1.6  virginica
131         1.9  virginica
132         2.0  virginica
133         2.2  virginica
134         1.5  virginica
135         1.4  virginica
136         2.3  virginica
137         2.4  virginica
138         1.8  virginica
139         1.8  virginica
140         2.1  virginica
141         2.4  virginica
142         2.3  virginica
143         1.9  virginica
144         2.3  virginica
145         2.5  virginica
146         2.3  virginica
147         1.9  virginica
148         2.0  virginica
149         2.3  virginica
150         1.8  virginica
```

dplyr - select()
========================================================

Column number:


```r
select(iris, 1:3)
```

```
    Sepal.Length Sepal.Width Petal.Length
1            5.1         3.5          1.4
2            4.9         3.0          1.4
3            4.7         3.2          1.3
4            4.6         3.1          1.5
5            5.0         3.6          1.4
6            5.4         3.9          1.7
7            4.6         3.4          1.4
8            5.0         3.4          1.5
9            4.4         2.9          1.4
10           4.9         3.1          1.5
11           5.4         3.7          1.5
12           4.8         3.4          1.6
13           4.8         3.0          1.4
14           4.3         3.0          1.1
15           5.8         4.0          1.2
16           5.7         4.4          1.5
17           5.4         3.9          1.3
18           5.1         3.5          1.4
19           5.7         3.8          1.7
20           5.1         3.8          1.5
21           5.4         3.4          1.7
22           5.1         3.7          1.5
23           4.6         3.6          1.0
24           5.1         3.3          1.7
25           4.8         3.4          1.9
26           5.0         3.0          1.6
27           5.0         3.4          1.6
28           5.2         3.5          1.5
29           5.2         3.4          1.4
30           4.7         3.2          1.6
31           4.8         3.1          1.6
32           5.4         3.4          1.5
33           5.2         4.1          1.5
34           5.5         4.2          1.4
35           4.9         3.1          1.5
36           5.0         3.2          1.2
37           5.5         3.5          1.3
38           4.9         3.6          1.4
39           4.4         3.0          1.3
40           5.1         3.4          1.5
41           5.0         3.5          1.3
42           4.5         2.3          1.3
43           4.4         3.2          1.3
44           5.0         3.5          1.6
45           5.1         3.8          1.9
46           4.8         3.0          1.4
47           5.1         3.8          1.6
48           4.6         3.2          1.4
49           5.3         3.7          1.5
50           5.0         3.3          1.4
51           7.0         3.2          4.7
52           6.4         3.2          4.5
53           6.9         3.1          4.9
54           5.5         2.3          4.0
55           6.5         2.8          4.6
56           5.7         2.8          4.5
57           6.3         3.3          4.7
58           4.9         2.4          3.3
59           6.6         2.9          4.6
60           5.2         2.7          3.9
61           5.0         2.0          3.5
62           5.9         3.0          4.2
63           6.0         2.2          4.0
64           6.1         2.9          4.7
65           5.6         2.9          3.6
66           6.7         3.1          4.4
67           5.6         3.0          4.5
68           5.8         2.7          4.1
69           6.2         2.2          4.5
70           5.6         2.5          3.9
71           5.9         3.2          4.8
72           6.1         2.8          4.0
73           6.3         2.5          4.9
74           6.1         2.8          4.7
75           6.4         2.9          4.3
76           6.6         3.0          4.4
77           6.8         2.8          4.8
78           6.7         3.0          5.0
79           6.0         2.9          4.5
80           5.7         2.6          3.5
81           5.5         2.4          3.8
82           5.5         2.4          3.7
83           5.8         2.7          3.9
84           6.0         2.7          5.1
85           5.4         3.0          4.5
86           6.0         3.4          4.5
87           6.7         3.1          4.7
88           6.3         2.3          4.4
89           5.6         3.0          4.1
90           5.5         2.5          4.0
91           5.5         2.6          4.4
92           6.1         3.0          4.6
93           5.8         2.6          4.0
94           5.0         2.3          3.3
95           5.6         2.7          4.2
96           5.7         3.0          4.2
97           5.7         2.9          4.2
98           6.2         2.9          4.3
99           5.1         2.5          3.0
100          5.7         2.8          4.1
101          6.3         3.3          6.0
102          5.8         2.7          5.1
103          7.1         3.0          5.9
104          6.3         2.9          5.6
105          6.5         3.0          5.8
106          7.6         3.0          6.6
107          4.9         2.5          4.5
108          7.3         2.9          6.3
109          6.7         2.5          5.8
110          7.2         3.6          6.1
111          6.5         3.2          5.1
112          6.4         2.7          5.3
113          6.8         3.0          5.5
114          5.7         2.5          5.0
115          5.8         2.8          5.1
116          6.4         3.2          5.3
117          6.5         3.0          5.5
118          7.7         3.8          6.7
119          7.7         2.6          6.9
120          6.0         2.2          5.0
121          6.9         3.2          5.7
122          5.6         2.8          4.9
123          7.7         2.8          6.7
124          6.3         2.7          4.9
125          6.7         3.3          5.7
126          7.2         3.2          6.0
127          6.2         2.8          4.8
128          6.1         3.0          4.9
129          6.4         2.8          5.6
130          7.2         3.0          5.8
131          7.4         2.8          6.1
132          7.9         3.8          6.4
133          6.4         2.8          5.6
134          6.3         2.8          5.1
135          6.1         2.6          5.6
136          7.7         3.0          6.1
137          6.3         3.4          5.6
138          6.4         3.1          5.5
139          6.0         3.0          4.8
140          6.9         3.1          5.4
141          6.7         3.1          5.6
142          6.9         3.1          5.1
143          5.8         2.7          5.1
144          6.8         3.2          5.9
145          6.7         3.3          5.7
146          6.7         3.0          5.2
147          6.3         2.5          5.0
148          6.5         3.0          5.2
149          6.2         3.4          5.4
150          5.9         3.0          5.1
```

dplyr - select()
========================================================

Not certain columns:


```r
select(iris,
       -Species,
       -Sepal.Width)
```

```
    Sepal.Length Petal.Length Petal.Width
1            5.1          1.4         0.2
2            4.9          1.4         0.2
3            4.7          1.3         0.2
4            4.6          1.5         0.2
5            5.0          1.4         0.2
6            5.4          1.7         0.4
7            4.6          1.4         0.3
8            5.0          1.5         0.2
9            4.4          1.4         0.2
10           4.9          1.5         0.1
11           5.4          1.5         0.2
12           4.8          1.6         0.2
13           4.8          1.4         0.1
14           4.3          1.1         0.1
15           5.8          1.2         0.2
16           5.7          1.5         0.4
17           5.4          1.3         0.4
18           5.1          1.4         0.3
19           5.7          1.7         0.3
20           5.1          1.5         0.3
21           5.4          1.7         0.2
22           5.1          1.5         0.4
23           4.6          1.0         0.2
24           5.1          1.7         0.5
25           4.8          1.9         0.2
26           5.0          1.6         0.2
27           5.0          1.6         0.4
28           5.2          1.5         0.2
29           5.2          1.4         0.2
30           4.7          1.6         0.2
31           4.8          1.6         0.2
32           5.4          1.5         0.4
33           5.2          1.5         0.1
34           5.5          1.4         0.2
35           4.9          1.5         0.2
36           5.0          1.2         0.2
37           5.5          1.3         0.2
38           4.9          1.4         0.1
39           4.4          1.3         0.2
40           5.1          1.5         0.2
41           5.0          1.3         0.3
42           4.5          1.3         0.3
43           4.4          1.3         0.2
44           5.0          1.6         0.6
45           5.1          1.9         0.4
46           4.8          1.4         0.3
47           5.1          1.6         0.2
48           4.6          1.4         0.2
49           5.3          1.5         0.2
50           5.0          1.4         0.2
51           7.0          4.7         1.4
52           6.4          4.5         1.5
53           6.9          4.9         1.5
54           5.5          4.0         1.3
55           6.5          4.6         1.5
56           5.7          4.5         1.3
57           6.3          4.7         1.6
58           4.9          3.3         1.0
59           6.6          4.6         1.3
60           5.2          3.9         1.4
61           5.0          3.5         1.0
62           5.9          4.2         1.5
63           6.0          4.0         1.0
64           6.1          4.7         1.4
65           5.6          3.6         1.3
66           6.7          4.4         1.4
67           5.6          4.5         1.5
68           5.8          4.1         1.0
69           6.2          4.5         1.5
70           5.6          3.9         1.1
71           5.9          4.8         1.8
72           6.1          4.0         1.3
73           6.3          4.9         1.5
74           6.1          4.7         1.2
75           6.4          4.3         1.3
76           6.6          4.4         1.4
77           6.8          4.8         1.4
78           6.7          5.0         1.7
79           6.0          4.5         1.5
80           5.7          3.5         1.0
81           5.5          3.8         1.1
82           5.5          3.7         1.0
83           5.8          3.9         1.2
84           6.0          5.1         1.6
85           5.4          4.5         1.5
86           6.0          4.5         1.6
87           6.7          4.7         1.5
88           6.3          4.4         1.3
89           5.6          4.1         1.3
90           5.5          4.0         1.3
91           5.5          4.4         1.2
92           6.1          4.6         1.4
93           5.8          4.0         1.2
94           5.0          3.3         1.0
95           5.6          4.2         1.3
96           5.7          4.2         1.2
97           5.7          4.2         1.3
98           6.2          4.3         1.3
99           5.1          3.0         1.1
100          5.7          4.1         1.3
101          6.3          6.0         2.5
102          5.8          5.1         1.9
103          7.1          5.9         2.1
104          6.3          5.6         1.8
105          6.5          5.8         2.2
106          7.6          6.6         2.1
107          4.9          4.5         1.7
108          7.3          6.3         1.8
109          6.7          5.8         1.8
110          7.2          6.1         2.5
111          6.5          5.1         2.0
112          6.4          5.3         1.9
113          6.8          5.5         2.1
114          5.7          5.0         2.0
115          5.8          5.1         2.4
116          6.4          5.3         2.3
117          6.5          5.5         1.8
118          7.7          6.7         2.2
119          7.7          6.9         2.3
120          6.0          5.0         1.5
121          6.9          5.7         2.3
122          5.6          4.9         2.0
123          7.7          6.7         2.0
124          6.3          4.9         1.8
125          6.7          5.7         2.1
126          7.2          6.0         1.8
127          6.2          4.8         1.8
128          6.1          4.9         1.8
129          6.4          5.6         2.1
130          7.2          5.8         1.6
131          7.4          6.1         1.9
132          7.9          6.4         2.0
133          6.4          5.6         2.2
134          6.3          5.1         1.5
135          6.1          5.6         1.4
136          7.7          6.1         2.3
137          6.3          5.6         2.4
138          6.4          5.5         1.8
139          6.0          4.8         1.8
140          6.9          5.4         2.1
141          6.7          5.6         2.4
142          6.9          5.1         2.3
143          5.8          5.1         1.9
144          6.8          5.9         2.3
145          6.7          5.7         2.5
146          6.7          5.2         2.3
147          6.3          5.0         1.9
148          6.5          5.2         2.0
149          6.2          5.4         2.3
150          5.9          5.1         1.8
```

dplyr - select()
========================================================

Columns starting with a name:


```r
select(iris, starts_with("Sepal"))
```

```
    Sepal.Length Sepal.Width
1            5.1         3.5
2            4.9         3.0
3            4.7         3.2
4            4.6         3.1
5            5.0         3.6
6            5.4         3.9
7            4.6         3.4
8            5.0         3.4
9            4.4         2.9
10           4.9         3.1
11           5.4         3.7
12           4.8         3.4
13           4.8         3.0
14           4.3         3.0
15           5.8         4.0
16           5.7         4.4
17           5.4         3.9
18           5.1         3.5
19           5.7         3.8
20           5.1         3.8
21           5.4         3.4
22           5.1         3.7
23           4.6         3.6
24           5.1         3.3
25           4.8         3.4
26           5.0         3.0
27           5.0         3.4
28           5.2         3.5
29           5.2         3.4
30           4.7         3.2
31           4.8         3.1
32           5.4         3.4
33           5.2         4.1
34           5.5         4.2
35           4.9         3.1
36           5.0         3.2
37           5.5         3.5
38           4.9         3.6
39           4.4         3.0
40           5.1         3.4
41           5.0         3.5
42           4.5         2.3
43           4.4         3.2
44           5.0         3.5
45           5.1         3.8
46           4.8         3.0
47           5.1         3.8
48           4.6         3.2
49           5.3         3.7
50           5.0         3.3
51           7.0         3.2
52           6.4         3.2
53           6.9         3.1
54           5.5         2.3
55           6.5         2.8
56           5.7         2.8
57           6.3         3.3
58           4.9         2.4
59           6.6         2.9
60           5.2         2.7
61           5.0         2.0
62           5.9         3.0
63           6.0         2.2
64           6.1         2.9
65           5.6         2.9
66           6.7         3.1
67           5.6         3.0
68           5.8         2.7
69           6.2         2.2
70           5.6         2.5
71           5.9         3.2
72           6.1         2.8
73           6.3         2.5
74           6.1         2.8
75           6.4         2.9
76           6.6         3.0
77           6.8         2.8
78           6.7         3.0
79           6.0         2.9
80           5.7         2.6
81           5.5         2.4
82           5.5         2.4
83           5.8         2.7
84           6.0         2.7
85           5.4         3.0
86           6.0         3.4
87           6.7         3.1
88           6.3         2.3
89           5.6         3.0
90           5.5         2.5
91           5.5         2.6
92           6.1         3.0
93           5.8         2.6
94           5.0         2.3
95           5.6         2.7
96           5.7         3.0
97           5.7         2.9
98           6.2         2.9
99           5.1         2.5
100          5.7         2.8
101          6.3         3.3
102          5.8         2.7
103          7.1         3.0
104          6.3         2.9
105          6.5         3.0
106          7.6         3.0
107          4.9         2.5
108          7.3         2.9
109          6.7         2.5
110          7.2         3.6
111          6.5         3.2
112          6.4         2.7
113          6.8         3.0
114          5.7         2.5
115          5.8         2.8
116          6.4         3.2
117          6.5         3.0
118          7.7         3.8
119          7.7         2.6
120          6.0         2.2
121          6.9         3.2
122          5.6         2.8
123          7.7         2.8
124          6.3         2.7
125          6.7         3.3
126          7.2         3.2
127          6.2         2.8
128          6.1         3.0
129          6.4         2.8
130          7.2         3.0
131          7.4         2.8
132          7.9         3.8
133          6.4         2.8
134          6.3         2.8
135          6.1         2.6
136          7.7         3.0
137          6.3         3.4
138          6.4         3.1
139          6.0         3.0
140          6.9         3.1
141          6.7         3.1
142          6.9         3.1
143          5.8         2.7
144          6.8         3.2
145          6.7         3.3
146          6.7         3.0
147          6.3         2.5
148          6.5         3.0
149          6.2         3.4
150          5.9         3.0
```

dplyr - rename()
========================================================

Sometimes a variable name is confusing, so we should rename() it:


```r
rename(iris,
       Leaf_L = Sepal.Length,
       Leaf_W = Sepal.Width)
```

```
    Leaf_L Leaf_W Petal.Length Petal.Width    Species
1      5.1    3.5          1.4         0.2     setosa
2      4.9    3.0          1.4         0.2     setosa
3      4.7    3.2          1.3         0.2     setosa
4      4.6    3.1          1.5         0.2     setosa
5      5.0    3.6          1.4         0.2     setosa
6      5.4    3.9          1.7         0.4     setosa
7      4.6    3.4          1.4         0.3     setosa
8      5.0    3.4          1.5         0.2     setosa
9      4.4    2.9          1.4         0.2     setosa
10     4.9    3.1          1.5         0.1     setosa
11     5.4    3.7          1.5         0.2     setosa
12     4.8    3.4          1.6         0.2     setosa
13     4.8    3.0          1.4         0.1     setosa
14     4.3    3.0          1.1         0.1     setosa
15     5.8    4.0          1.2         0.2     setosa
16     5.7    4.4          1.5         0.4     setosa
17     5.4    3.9          1.3         0.4     setosa
18     5.1    3.5          1.4         0.3     setosa
19     5.7    3.8          1.7         0.3     setosa
20     5.1    3.8          1.5         0.3     setosa
21     5.4    3.4          1.7         0.2     setosa
22     5.1    3.7          1.5         0.4     setosa
23     4.6    3.6          1.0         0.2     setosa
24     5.1    3.3          1.7         0.5     setosa
25     4.8    3.4          1.9         0.2     setosa
26     5.0    3.0          1.6         0.2     setosa
27     5.0    3.4          1.6         0.4     setosa
28     5.2    3.5          1.5         0.2     setosa
29     5.2    3.4          1.4         0.2     setosa
30     4.7    3.2          1.6         0.2     setosa
31     4.8    3.1          1.6         0.2     setosa
32     5.4    3.4          1.5         0.4     setosa
33     5.2    4.1          1.5         0.1     setosa
34     5.5    4.2          1.4         0.2     setosa
35     4.9    3.1          1.5         0.2     setosa
36     5.0    3.2          1.2         0.2     setosa
37     5.5    3.5          1.3         0.2     setosa
38     4.9    3.6          1.4         0.1     setosa
39     4.4    3.0          1.3         0.2     setosa
40     5.1    3.4          1.5         0.2     setosa
41     5.0    3.5          1.3         0.3     setosa
42     4.5    2.3          1.3         0.3     setosa
43     4.4    3.2          1.3         0.2     setosa
44     5.0    3.5          1.6         0.6     setosa
45     5.1    3.8          1.9         0.4     setosa
46     4.8    3.0          1.4         0.3     setosa
47     5.1    3.8          1.6         0.2     setosa
48     4.6    3.2          1.4         0.2     setosa
49     5.3    3.7          1.5         0.2     setosa
50     5.0    3.3          1.4         0.2     setosa
51     7.0    3.2          4.7         1.4 versicolor
52     6.4    3.2          4.5         1.5 versicolor
53     6.9    3.1          4.9         1.5 versicolor
54     5.5    2.3          4.0         1.3 versicolor
55     6.5    2.8          4.6         1.5 versicolor
56     5.7    2.8          4.5         1.3 versicolor
57     6.3    3.3          4.7         1.6 versicolor
58     4.9    2.4          3.3         1.0 versicolor
59     6.6    2.9          4.6         1.3 versicolor
60     5.2    2.7          3.9         1.4 versicolor
61     5.0    2.0          3.5         1.0 versicolor
62     5.9    3.0          4.2         1.5 versicolor
63     6.0    2.2          4.0         1.0 versicolor
64     6.1    2.9          4.7         1.4 versicolor
65     5.6    2.9          3.6         1.3 versicolor
66     6.7    3.1          4.4         1.4 versicolor
67     5.6    3.0          4.5         1.5 versicolor
68     5.8    2.7          4.1         1.0 versicolor
69     6.2    2.2          4.5         1.5 versicolor
70     5.6    2.5          3.9         1.1 versicolor
71     5.9    3.2          4.8         1.8 versicolor
72     6.1    2.8          4.0         1.3 versicolor
73     6.3    2.5          4.9         1.5 versicolor
74     6.1    2.8          4.7         1.2 versicolor
75     6.4    2.9          4.3         1.3 versicolor
76     6.6    3.0          4.4         1.4 versicolor
77     6.8    2.8          4.8         1.4 versicolor
78     6.7    3.0          5.0         1.7 versicolor
79     6.0    2.9          4.5         1.5 versicolor
80     5.7    2.6          3.5         1.0 versicolor
81     5.5    2.4          3.8         1.1 versicolor
82     5.5    2.4          3.7         1.0 versicolor
83     5.8    2.7          3.9         1.2 versicolor
84     6.0    2.7          5.1         1.6 versicolor
85     5.4    3.0          4.5         1.5 versicolor
86     6.0    3.4          4.5         1.6 versicolor
87     6.7    3.1          4.7         1.5 versicolor
88     6.3    2.3          4.4         1.3 versicolor
89     5.6    3.0          4.1         1.3 versicolor
90     5.5    2.5          4.0         1.3 versicolor
91     5.5    2.6          4.4         1.2 versicolor
92     6.1    3.0          4.6         1.4 versicolor
93     5.8    2.6          4.0         1.2 versicolor
94     5.0    2.3          3.3         1.0 versicolor
95     5.6    2.7          4.2         1.3 versicolor
96     5.7    3.0          4.2         1.2 versicolor
97     5.7    2.9          4.2         1.3 versicolor
98     6.2    2.9          4.3         1.3 versicolor
99     5.1    2.5          3.0         1.1 versicolor
100    5.7    2.8          4.1         1.3 versicolor
101    6.3    3.3          6.0         2.5  virginica
102    5.8    2.7          5.1         1.9  virginica
103    7.1    3.0          5.9         2.1  virginica
104    6.3    2.9          5.6         1.8  virginica
105    6.5    3.0          5.8         2.2  virginica
106    7.6    3.0          6.6         2.1  virginica
107    4.9    2.5          4.5         1.7  virginica
108    7.3    2.9          6.3         1.8  virginica
109    6.7    2.5          5.8         1.8  virginica
110    7.2    3.6          6.1         2.5  virginica
111    6.5    3.2          5.1         2.0  virginica
112    6.4    2.7          5.3         1.9  virginica
113    6.8    3.0          5.5         2.1  virginica
114    5.7    2.5          5.0         2.0  virginica
115    5.8    2.8          5.1         2.4  virginica
116    6.4    3.2          5.3         2.3  virginica
117    6.5    3.0          5.5         1.8  virginica
118    7.7    3.8          6.7         2.2  virginica
119    7.7    2.6          6.9         2.3  virginica
120    6.0    2.2          5.0         1.5  virginica
121    6.9    3.2          5.7         2.3  virginica
122    5.6    2.8          4.9         2.0  virginica
123    7.7    2.8          6.7         2.0  virginica
124    6.3    2.7          4.9         1.8  virginica
125    6.7    3.3          5.7         2.1  virginica
126    7.2    3.2          6.0         1.8  virginica
127    6.2    2.8          4.8         1.8  virginica
128    6.1    3.0          4.9         1.8  virginica
129    6.4    2.8          5.6         2.1  virginica
130    7.2    3.0          5.8         1.6  virginica
131    7.4    2.8          6.1         1.9  virginica
132    7.9    3.8          6.4         2.0  virginica
133    6.4    2.8          5.6         2.2  virginica
134    6.3    2.8          5.1         1.5  virginica
135    6.1    2.6          5.6         1.4  virginica
136    7.7    3.0          6.1         2.3  virginica
137    6.3    3.4          5.6         2.4  virginica
138    6.4    3.1          5.5         1.8  virginica
139    6.0    3.0          4.8         1.8  virginica
140    6.9    3.1          5.4         2.1  virginica
141    6.7    3.1          5.6         2.4  virginica
142    6.9    3.1          5.1         2.3  virginica
143    5.8    2.7          5.1         1.9  virginica
144    6.8    3.2          5.9         2.3  virginica
145    6.7    3.3          5.7         2.5  virginica
146    6.7    3.0          5.2         2.3  virginica
147    6.3    2.5          5.0         1.9  virginica
148    6.5    3.0          5.2         2.0  virginica
149    6.2    3.4          5.4         2.3  virginica
150    5.9    3.0          5.1         1.8  virginica
```

dplyr - rename()/select()
========================================================

We can also do this with select():


```r
select(iris,
       Leaf_L = Sepal.Length,
       Leaf_W = Sepal.Width)
```

```
    Leaf_L Leaf_W
1      5.1    3.5
2      4.9    3.0
3      4.7    3.2
4      4.6    3.1
5      5.0    3.6
6      5.4    3.9
7      4.6    3.4
8      5.0    3.4
9      4.4    2.9
10     4.9    3.1
11     5.4    3.7
12     4.8    3.4
13     4.8    3.0
14     4.3    3.0
15     5.8    4.0
16     5.7    4.4
17     5.4    3.9
18     5.1    3.5
19     5.7    3.8
20     5.1    3.8
21     5.4    3.4
22     5.1    3.7
23     4.6    3.6
24     5.1    3.3
25     4.8    3.4
26     5.0    3.0
27     5.0    3.4
28     5.2    3.5
29     5.2    3.4
30     4.7    3.2
31     4.8    3.1
32     5.4    3.4
33     5.2    4.1
34     5.5    4.2
35     4.9    3.1
36     5.0    3.2
37     5.5    3.5
38     4.9    3.6
39     4.4    3.0
40     5.1    3.4
41     5.0    3.5
42     4.5    2.3
43     4.4    3.2
44     5.0    3.5
45     5.1    3.8
46     4.8    3.0
47     5.1    3.8
48     4.6    3.2
49     5.3    3.7
50     5.0    3.3
51     7.0    3.2
52     6.4    3.2
53     6.9    3.1
54     5.5    2.3
55     6.5    2.8
56     5.7    2.8
57     6.3    3.3
58     4.9    2.4
59     6.6    2.9
60     5.2    2.7
61     5.0    2.0
62     5.9    3.0
63     6.0    2.2
64     6.1    2.9
65     5.6    2.9
66     6.7    3.1
67     5.6    3.0
68     5.8    2.7
69     6.2    2.2
70     5.6    2.5
71     5.9    3.2
72     6.1    2.8
73     6.3    2.5
74     6.1    2.8
75     6.4    2.9
76     6.6    3.0
77     6.8    2.8
78     6.7    3.0
79     6.0    2.9
80     5.7    2.6
81     5.5    2.4
82     5.5    2.4
83     5.8    2.7
84     6.0    2.7
85     5.4    3.0
86     6.0    3.4
87     6.7    3.1
88     6.3    2.3
89     5.6    3.0
90     5.5    2.5
91     5.5    2.6
92     6.1    3.0
93     5.8    2.6
94     5.0    2.3
95     5.6    2.7
96     5.7    3.0
97     5.7    2.9
98     6.2    2.9
99     5.1    2.5
100    5.7    2.8
101    6.3    3.3
102    5.8    2.7
103    7.1    3.0
104    6.3    2.9
105    6.5    3.0
106    7.6    3.0
107    4.9    2.5
108    7.3    2.9
109    6.7    2.5
110    7.2    3.6
111    6.5    3.2
112    6.4    2.7
113    6.8    3.0
114    5.7    2.5
115    5.8    2.8
116    6.4    3.2
117    6.5    3.0
118    7.7    3.8
119    7.7    2.6
120    6.0    2.2
121    6.9    3.2
122    5.6    2.8
123    7.7    2.8
124    6.3    2.7
125    6.7    3.3
126    7.2    3.2
127    6.2    2.8
128    6.1    3.0
129    6.4    2.8
130    7.2    3.0
131    7.4    2.8
132    7.9    3.8
133    6.4    2.8
134    6.3    2.8
135    6.1    2.6
136    7.7    3.0
137    6.3    3.4
138    6.4    3.1
139    6.0    3.0
140    6.9    3.1
141    6.7    3.1
142    6.9    3.1
143    5.8    2.7
144    6.8    3.2
145    6.7    3.3
146    6.7    3.0
147    6.3    2.5
148    6.5    3.0
149    6.2    3.4
150    5.9    3.0
```

dplyr - filter()
========================================================

Often, you only want to look at observations with particular parameters, for this you can use filter():


```r
iris2 <- select(iris, starts_with("Petal"), Species)
filter(iris2, Species == "virginica")
```

```
   Petal.Length Petal.Width   Species
1           6.0         2.5 virginica
2           5.1         1.9 virginica
3           5.9         2.1 virginica
4           5.6         1.8 virginica
5           5.8         2.2 virginica
6           6.6         2.1 virginica
7           4.5         1.7 virginica
8           6.3         1.8 virginica
9           5.8         1.8 virginica
10          6.1         2.5 virginica
11          5.1         2.0 virginica
12          5.3         1.9 virginica
13          5.5         2.1 virginica
14          5.0         2.0 virginica
15          5.1         2.4 virginica
16          5.3         2.3 virginica
17          5.5         1.8 virginica
18          6.7         2.2 virginica
19          6.9         2.3 virginica
20          5.0         1.5 virginica
21          5.7         2.3 virginica
22          4.9         2.0 virginica
23          6.7         2.0 virginica
24          4.9         1.8 virginica
25          5.7         2.1 virginica
26          6.0         1.8 virginica
27          4.8         1.8 virginica
28          4.9         1.8 virginica
29          5.6         2.1 virginica
30          5.8         1.6 virginica
31          6.1         1.9 virginica
32          6.4         2.0 virginica
33          5.6         2.2 virginica
34          5.1         1.5 virginica
35          5.6         1.4 virginica
36          6.1         2.3 virginica
37          5.6         2.4 virginica
38          5.5         1.8 virginica
39          4.8         1.8 virginica
40          5.4         2.1 virginica
41          5.6         2.4 virginica
42          5.1         2.3 virginica
43          5.1         1.9 virginica
44          5.9         2.3 virginica
45          5.7         2.5 virginica
46          5.2         2.3 virginica
47          5.0         1.9 virginica
48          5.2         2.0 virginica
49          5.4         2.3 virginica
50          5.1         1.8 virginica
```

dplyr - filter()
========================================================

You can use the >, <, ==, >=, and <= operators to filter() rows:


```r
filter(iris2,
       Petal.Length > 4,
       Petal.Width <=1.2)
```

```
  Petal.Length Petal.Width    Species
1          4.1         1.0 versicolor
2          4.7         1.2 versicolor
3          4.4         1.2 versicolor
4          4.2         1.2 versicolor
```

dplyr - arrange()
========================================================

To sort by a variable, use arrange():


```r
arrange(iris2, Petal.Length)
```

```
    Petal.Length Petal.Width    Species
1            1.0         0.2     setosa
2            1.1         0.1     setosa
3            1.2         0.2     setosa
4            1.2         0.2     setosa
5            1.3         0.2     setosa
6            1.3         0.4     setosa
7            1.3         0.2     setosa
8            1.3         0.2     setosa
9            1.3         0.3     setosa
10           1.3         0.3     setosa
11           1.3         0.2     setosa
12           1.4         0.2     setosa
13           1.4         0.2     setosa
14           1.4         0.2     setosa
15           1.4         0.3     setosa
16           1.4         0.2     setosa
17           1.4         0.1     setosa
18           1.4         0.3     setosa
19           1.4         0.2     setosa
20           1.4         0.2     setosa
21           1.4         0.1     setosa
22           1.4         0.3     setosa
23           1.4         0.2     setosa
24           1.4         0.2     setosa
25           1.5         0.2     setosa
26           1.5         0.2     setosa
27           1.5         0.1     setosa
28           1.5         0.2     setosa
29           1.5         0.4     setosa
30           1.5         0.3     setosa
31           1.5         0.4     setosa
32           1.5         0.2     setosa
33           1.5         0.4     setosa
34           1.5         0.1     setosa
35           1.5         0.2     setosa
36           1.5         0.2     setosa
37           1.5         0.2     setosa
38           1.6         0.2     setosa
39           1.6         0.2     setosa
40           1.6         0.4     setosa
41           1.6         0.2     setosa
42           1.6         0.2     setosa
43           1.6         0.6     setosa
44           1.6         0.2     setosa
45           1.7         0.4     setosa
46           1.7         0.3     setosa
47           1.7         0.2     setosa
48           1.7         0.5     setosa
49           1.9         0.2     setosa
50           1.9         0.4     setosa
51           3.0         1.1 versicolor
52           3.3         1.0 versicolor
53           3.3         1.0 versicolor
54           3.5         1.0 versicolor
55           3.5         1.0 versicolor
56           3.6         1.3 versicolor
57           3.7         1.0 versicolor
58           3.8         1.1 versicolor
59           3.9         1.4 versicolor
60           3.9         1.1 versicolor
61           3.9         1.2 versicolor
62           4.0         1.3 versicolor
63           4.0         1.0 versicolor
64           4.0         1.3 versicolor
65           4.0         1.3 versicolor
66           4.0         1.2 versicolor
67           4.1         1.0 versicolor
68           4.1         1.3 versicolor
69           4.1         1.3 versicolor
70           4.2         1.5 versicolor
71           4.2         1.3 versicolor
72           4.2         1.2 versicolor
73           4.2         1.3 versicolor
74           4.3         1.3 versicolor
75           4.3         1.3 versicolor
76           4.4         1.4 versicolor
77           4.4         1.4 versicolor
78           4.4         1.3 versicolor
79           4.4         1.2 versicolor
80           4.5         1.5 versicolor
81           4.5         1.3 versicolor
82           4.5         1.5 versicolor
83           4.5         1.5 versicolor
84           4.5         1.5 versicolor
85           4.5         1.5 versicolor
86           4.5         1.6 versicolor
87           4.5         1.7  virginica
88           4.6         1.5 versicolor
89           4.6         1.3 versicolor
90           4.6         1.4 versicolor
91           4.7         1.4 versicolor
92           4.7         1.6 versicolor
93           4.7         1.4 versicolor
94           4.7         1.2 versicolor
95           4.7         1.5 versicolor
96           4.8         1.8 versicolor
97           4.8         1.4 versicolor
98           4.8         1.8  virginica
99           4.8         1.8  virginica
100          4.9         1.5 versicolor
101          4.9         1.5 versicolor
102          4.9         2.0  virginica
103          4.9         1.8  virginica
104          4.9         1.8  virginica
105          5.0         1.7 versicolor
106          5.0         2.0  virginica
107          5.0         1.5  virginica
108          5.0         1.9  virginica
109          5.1         1.6 versicolor
110          5.1         1.9  virginica
111          5.1         2.0  virginica
112          5.1         2.4  virginica
113          5.1         1.5  virginica
114          5.1         2.3  virginica
115          5.1         1.9  virginica
116          5.1         1.8  virginica
117          5.2         2.3  virginica
118          5.2         2.0  virginica
119          5.3         1.9  virginica
120          5.3         2.3  virginica
121          5.4         2.1  virginica
122          5.4         2.3  virginica
123          5.5         2.1  virginica
124          5.5         1.8  virginica
125          5.5         1.8  virginica
126          5.6         1.8  virginica
127          5.6         2.1  virginica
128          5.6         2.2  virginica
129          5.6         1.4  virginica
130          5.6         2.4  virginica
131          5.6         2.4  virginica
132          5.7         2.3  virginica
133          5.7         2.1  virginica
134          5.7         2.5  virginica
135          5.8         2.2  virginica
136          5.8         1.8  virginica
137          5.8         1.6  virginica
138          5.9         2.1  virginica
139          5.9         2.3  virginica
140          6.0         2.5  virginica
141          6.0         1.8  virginica
142          6.1         2.5  virginica
143          6.1         1.9  virginica
144          6.1         2.3  virginica
145          6.3         1.8  virginica
146          6.4         2.0  virginica
147          6.6         2.1  virginica
148          6.7         2.2  virginica
149          6.7         2.0  virginica
150          6.9         2.3  virginica
```

dplyr - arrange()
========================================================

Use desc() to arrange() descendingly:


```r
arrange(iris2, desc(Petal.Length))
```

```
    Petal.Length Petal.Width    Species
1            6.9         2.3  virginica
2            6.7         2.2  virginica
3            6.7         2.0  virginica
4            6.6         2.1  virginica
5            6.4         2.0  virginica
6            6.3         1.8  virginica
7            6.1         2.5  virginica
8            6.1         1.9  virginica
9            6.1         2.3  virginica
10           6.0         2.5  virginica
11           6.0         1.8  virginica
12           5.9         2.1  virginica
13           5.9         2.3  virginica
14           5.8         2.2  virginica
15           5.8         1.8  virginica
16           5.8         1.6  virginica
17           5.7         2.3  virginica
18           5.7         2.1  virginica
19           5.7         2.5  virginica
20           5.6         1.8  virginica
21           5.6         2.1  virginica
22           5.6         2.2  virginica
23           5.6         1.4  virginica
24           5.6         2.4  virginica
25           5.6         2.4  virginica
26           5.5         2.1  virginica
27           5.5         1.8  virginica
28           5.5         1.8  virginica
29           5.4         2.1  virginica
30           5.4         2.3  virginica
31           5.3         1.9  virginica
32           5.3         2.3  virginica
33           5.2         2.3  virginica
34           5.2         2.0  virginica
35           5.1         1.6 versicolor
36           5.1         1.9  virginica
37           5.1         2.0  virginica
38           5.1         2.4  virginica
39           5.1         1.5  virginica
40           5.1         2.3  virginica
41           5.1         1.9  virginica
42           5.1         1.8  virginica
43           5.0         1.7 versicolor
44           5.0         2.0  virginica
45           5.0         1.5  virginica
46           5.0         1.9  virginica
47           4.9         1.5 versicolor
48           4.9         1.5 versicolor
49           4.9         2.0  virginica
50           4.9         1.8  virginica
51           4.9         1.8  virginica
52           4.8         1.8 versicolor
53           4.8         1.4 versicolor
54           4.8         1.8  virginica
55           4.8         1.8  virginica
56           4.7         1.4 versicolor
57           4.7         1.6 versicolor
58           4.7         1.4 versicolor
59           4.7         1.2 versicolor
60           4.7         1.5 versicolor
61           4.6         1.5 versicolor
62           4.6         1.3 versicolor
63           4.6         1.4 versicolor
64           4.5         1.5 versicolor
65           4.5         1.3 versicolor
66           4.5         1.5 versicolor
67           4.5         1.5 versicolor
68           4.5         1.5 versicolor
69           4.5         1.5 versicolor
70           4.5         1.6 versicolor
71           4.5         1.7  virginica
72           4.4         1.4 versicolor
73           4.4         1.4 versicolor
74           4.4         1.3 versicolor
75           4.4         1.2 versicolor
76           4.3         1.3 versicolor
77           4.3         1.3 versicolor
78           4.2         1.5 versicolor
79           4.2         1.3 versicolor
80           4.2         1.2 versicolor
81           4.2         1.3 versicolor
82           4.1         1.0 versicolor
83           4.1         1.3 versicolor
84           4.1         1.3 versicolor
85           4.0         1.3 versicolor
86           4.0         1.0 versicolor
87           4.0         1.3 versicolor
88           4.0         1.3 versicolor
89           4.0         1.2 versicolor
90           3.9         1.4 versicolor
91           3.9         1.1 versicolor
92           3.9         1.2 versicolor
93           3.8         1.1 versicolor
94           3.7         1.0 versicolor
95           3.6         1.3 versicolor
96           3.5         1.0 versicolor
97           3.5         1.0 versicolor
98           3.3         1.0 versicolor
99           3.3         1.0 versicolor
100          3.0         1.1 versicolor
101          1.9         0.2     setosa
102          1.9         0.4     setosa
103          1.7         0.4     setosa
104          1.7         0.3     setosa
105          1.7         0.2     setosa
106          1.7         0.5     setosa
107          1.6         0.2     setosa
108          1.6         0.2     setosa
109          1.6         0.4     setosa
110          1.6         0.2     setosa
111          1.6         0.2     setosa
112          1.6         0.6     setosa
113          1.6         0.2     setosa
114          1.5         0.2     setosa
115          1.5         0.2     setosa
116          1.5         0.1     setosa
117          1.5         0.2     setosa
118          1.5         0.4     setosa
119          1.5         0.3     setosa
120          1.5         0.4     setosa
121          1.5         0.2     setosa
122          1.5         0.4     setosa
123          1.5         0.1     setosa
124          1.5         0.2     setosa
125          1.5         0.2     setosa
126          1.5         0.2     setosa
127          1.4         0.2     setosa
128          1.4         0.2     setosa
129          1.4         0.2     setosa
130          1.4         0.3     setosa
131          1.4         0.2     setosa
132          1.4         0.1     setosa
133          1.4         0.3     setosa
134          1.4         0.2     setosa
135          1.4         0.2     setosa
136          1.4         0.1     setosa
137          1.4         0.3     setosa
138          1.4         0.2     setosa
139          1.4         0.2     setosa
140          1.3         0.2     setosa
141          1.3         0.4     setosa
142          1.3         0.2     setosa
143          1.3         0.2     setosa
144          1.3         0.3     setosa
145          1.3         0.3     setosa
146          1.3         0.2     setosa
147          1.2         0.2     setosa
148          1.2         0.2     setosa
149          1.1         0.1     setosa
150          1.0         0.2     setosa
```

dplyr - arrange()
========================================================

Can arrange() by multiple variables to account for ties:


```r
arrange(iris2,
        desc(Petal.Length),
        desc(Petal.Width))
```

```
    Petal.Length Petal.Width    Species
1            6.9         2.3  virginica
2            6.7         2.2  virginica
3            6.7         2.0  virginica
4            6.6         2.1  virginica
5            6.4         2.0  virginica
6            6.3         1.8  virginica
7            6.1         2.5  virginica
8            6.1         2.3  virginica
9            6.1         1.9  virginica
10           6.0         2.5  virginica
11           6.0         1.8  virginica
12           5.9         2.3  virginica
13           5.9         2.1  virginica
14           5.8         2.2  virginica
15           5.8         1.8  virginica
16           5.8         1.6  virginica
17           5.7         2.5  virginica
18           5.7         2.3  virginica
19           5.7         2.1  virginica
20           5.6         2.4  virginica
21           5.6         2.4  virginica
22           5.6         2.2  virginica
23           5.6         2.1  virginica
24           5.6         1.8  virginica
25           5.6         1.4  virginica
26           5.5         2.1  virginica
27           5.5         1.8  virginica
28           5.5         1.8  virginica
29           5.4         2.3  virginica
30           5.4         2.1  virginica
31           5.3         2.3  virginica
32           5.3         1.9  virginica
33           5.2         2.3  virginica
34           5.2         2.0  virginica
35           5.1         2.4  virginica
36           5.1         2.3  virginica
37           5.1         2.0  virginica
38           5.1         1.9  virginica
39           5.1         1.9  virginica
40           5.1         1.8  virginica
41           5.1         1.6 versicolor
42           5.1         1.5  virginica
43           5.0         2.0  virginica
44           5.0         1.9  virginica
45           5.0         1.7 versicolor
46           5.0         1.5  virginica
47           4.9         2.0  virginica
48           4.9         1.8  virginica
49           4.9         1.8  virginica
50           4.9         1.5 versicolor
51           4.9         1.5 versicolor
52           4.8         1.8 versicolor
53           4.8         1.8  virginica
54           4.8         1.8  virginica
55           4.8         1.4 versicolor
56           4.7         1.6 versicolor
57           4.7         1.5 versicolor
58           4.7         1.4 versicolor
59           4.7         1.4 versicolor
60           4.7         1.2 versicolor
61           4.6         1.5 versicolor
62           4.6         1.4 versicolor
63           4.6         1.3 versicolor
64           4.5         1.7  virginica
65           4.5         1.6 versicolor
66           4.5         1.5 versicolor
67           4.5         1.5 versicolor
68           4.5         1.5 versicolor
69           4.5         1.5 versicolor
70           4.5         1.5 versicolor
71           4.5         1.3 versicolor
72           4.4         1.4 versicolor
73           4.4         1.4 versicolor
74           4.4         1.3 versicolor
75           4.4         1.2 versicolor
76           4.3         1.3 versicolor
77           4.3         1.3 versicolor
78           4.2         1.5 versicolor
79           4.2         1.3 versicolor
80           4.2         1.3 versicolor
81           4.2         1.2 versicolor
82           4.1         1.3 versicolor
83           4.1         1.3 versicolor
84           4.1         1.0 versicolor
85           4.0         1.3 versicolor
86           4.0         1.3 versicolor
87           4.0         1.3 versicolor
88           4.0         1.2 versicolor
89           4.0         1.0 versicolor
90           3.9         1.4 versicolor
91           3.9         1.2 versicolor
92           3.9         1.1 versicolor
93           3.8         1.1 versicolor
94           3.7         1.0 versicolor
95           3.6         1.3 versicolor
96           3.5         1.0 versicolor
97           3.5         1.0 versicolor
98           3.3         1.0 versicolor
99           3.3         1.0 versicolor
100          3.0         1.1 versicolor
101          1.9         0.4     setosa
102          1.9         0.2     setosa
103          1.7         0.5     setosa
104          1.7         0.4     setosa
105          1.7         0.3     setosa
106          1.7         0.2     setosa
107          1.6         0.6     setosa
108          1.6         0.4     setosa
109          1.6         0.2     setosa
110          1.6         0.2     setosa
111          1.6         0.2     setosa
112          1.6         0.2     setosa
113          1.6         0.2     setosa
114          1.5         0.4     setosa
115          1.5         0.4     setosa
116          1.5         0.4     setosa
117          1.5         0.3     setosa
118          1.5         0.2     setosa
119          1.5         0.2     setosa
120          1.5         0.2     setosa
121          1.5         0.2     setosa
122          1.5         0.2     setosa
123          1.5         0.2     setosa
124          1.5         0.2     setosa
125          1.5         0.1     setosa
126          1.5         0.1     setosa
127          1.4         0.3     setosa
128          1.4         0.3     setosa
129          1.4         0.3     setosa
130          1.4         0.2     setosa
131          1.4         0.2     setosa
132          1.4         0.2     setosa
133          1.4         0.2     setosa
134          1.4         0.2     setosa
135          1.4         0.2     setosa
136          1.4         0.2     setosa
137          1.4         0.2     setosa
138          1.4         0.1     setosa
139          1.4         0.1     setosa
140          1.3         0.4     setosa
141          1.3         0.3     setosa
142          1.3         0.3     setosa
143          1.3         0.2     setosa
144          1.3         0.2     setosa
145          1.3         0.2     setosa
146          1.3         0.2     setosa
147          1.2         0.2     setosa
148          1.2         0.2     setosa
149          1.1         0.1     setosa
150          1.0         0.2     setosa
```

dplyr - %>%
========================================================

To use multiple functions in a row, use the %>% ("pipeline"):


```r
iris %>%
    select(starts_with("Sepal"), Species) %>%
    filter(Sepal.Length >= 6) %>%
    arrange(desc(Sepal.Width))
```

```
   Sepal.Length Sepal.Width    Species
1           7.7         3.8  virginica
2           7.9         3.8  virginica
3           7.2         3.6  virginica
4           6.0         3.4 versicolor
5           6.3         3.4  virginica
6           6.2         3.4  virginica
7           6.3         3.3 versicolor
8           6.3         3.3  virginica
9           6.7         3.3  virginica
10          6.7         3.3  virginica
11          7.0         3.2 versicolor
12          6.4         3.2 versicolor
13          6.5         3.2  virginica
14          6.4         3.2  virginica
15          6.9         3.2  virginica
16          7.2         3.2  virginica
17          6.8         3.2  virginica
18          6.9         3.1 versicolor
19          6.7         3.1 versicolor
20          6.7         3.1 versicolor
21          6.4         3.1  virginica
22          6.9         3.1  virginica
23          6.7         3.1  virginica
24          6.9         3.1  virginica
25          6.6         3.0 versicolor
26          6.7         3.0 versicolor
27          6.1         3.0 versicolor
28          7.1         3.0  virginica
29          6.5         3.0  virginica
30          7.6         3.0  virginica
31          6.8         3.0  virginica
32          6.5         3.0  virginica
33          6.1         3.0  virginica
34          7.2         3.0  virginica
35          7.7         3.0  virginica
36          6.0         3.0  virginica
37          6.7         3.0  virginica
38          6.5         3.0  virginica
39          6.6         2.9 versicolor
40          6.1         2.9 versicolor
41          6.4         2.9 versicolor
42          6.0         2.9 versicolor
43          6.2         2.9 versicolor
44          6.3         2.9  virginica
45          7.3         2.9  virginica
46          6.5         2.8 versicolor
47          6.1         2.8 versicolor
48          6.1         2.8 versicolor
49          6.8         2.8 versicolor
50          7.7         2.8  virginica
51          6.2         2.8  virginica
52          6.4         2.8  virginica
53          7.4         2.8  virginica
54          6.4         2.8  virginica
55          6.3         2.8  virginica
56          6.0         2.7 versicolor
57          6.4         2.7  virginica
58          6.3         2.7  virginica
59          7.7         2.6  virginica
60          6.1         2.6  virginica
61          6.3         2.5 versicolor
62          6.7         2.5  virginica
63          6.3         2.5  virginica
64          6.3         2.3 versicolor
65          6.0         2.2 versicolor
66          6.2         2.2 versicolor
67          6.0         2.2  virginica
```

dplyr - mutate()
========================================================

To create a new variable for your dataset, use mutate():


```r
mutate(iris2, Add3 = Petal.Length + 3)
```

```
    Petal.Length Petal.Width    Species Add3
1            1.4         0.2     setosa  4.4
2            1.4         0.2     setosa  4.4
3            1.3         0.2     setosa  4.3
4            1.5         0.2     setosa  4.5
5            1.4         0.2     setosa  4.4
6            1.7         0.4     setosa  4.7
7            1.4         0.3     setosa  4.4
8            1.5         0.2     setosa  4.5
9            1.4         0.2     setosa  4.4
10           1.5         0.1     setosa  4.5
11           1.5         0.2     setosa  4.5
12           1.6         0.2     setosa  4.6
13           1.4         0.1     setosa  4.4
14           1.1         0.1     setosa  4.1
15           1.2         0.2     setosa  4.2
16           1.5         0.4     setosa  4.5
17           1.3         0.4     setosa  4.3
18           1.4         0.3     setosa  4.4
19           1.7         0.3     setosa  4.7
20           1.5         0.3     setosa  4.5
21           1.7         0.2     setosa  4.7
22           1.5         0.4     setosa  4.5
23           1.0         0.2     setosa  4.0
24           1.7         0.5     setosa  4.7
25           1.9         0.2     setosa  4.9
26           1.6         0.2     setosa  4.6
27           1.6         0.4     setosa  4.6
28           1.5         0.2     setosa  4.5
29           1.4         0.2     setosa  4.4
30           1.6         0.2     setosa  4.6
31           1.6         0.2     setosa  4.6
32           1.5         0.4     setosa  4.5
33           1.5         0.1     setosa  4.5
34           1.4         0.2     setosa  4.4
35           1.5         0.2     setosa  4.5
36           1.2         0.2     setosa  4.2
37           1.3         0.2     setosa  4.3
38           1.4         0.1     setosa  4.4
39           1.3         0.2     setosa  4.3
40           1.5         0.2     setosa  4.5
41           1.3         0.3     setosa  4.3
42           1.3         0.3     setosa  4.3
43           1.3         0.2     setosa  4.3
44           1.6         0.6     setosa  4.6
45           1.9         0.4     setosa  4.9
46           1.4         0.3     setosa  4.4
47           1.6         0.2     setosa  4.6
48           1.4         0.2     setosa  4.4
49           1.5         0.2     setosa  4.5
50           1.4         0.2     setosa  4.4
51           4.7         1.4 versicolor  7.7
52           4.5         1.5 versicolor  7.5
53           4.9         1.5 versicolor  7.9
54           4.0         1.3 versicolor  7.0
55           4.6         1.5 versicolor  7.6
56           4.5         1.3 versicolor  7.5
57           4.7         1.6 versicolor  7.7
58           3.3         1.0 versicolor  6.3
59           4.6         1.3 versicolor  7.6
60           3.9         1.4 versicolor  6.9
61           3.5         1.0 versicolor  6.5
62           4.2         1.5 versicolor  7.2
63           4.0         1.0 versicolor  7.0
64           4.7         1.4 versicolor  7.7
65           3.6         1.3 versicolor  6.6
66           4.4         1.4 versicolor  7.4
67           4.5         1.5 versicolor  7.5
68           4.1         1.0 versicolor  7.1
69           4.5         1.5 versicolor  7.5
70           3.9         1.1 versicolor  6.9
71           4.8         1.8 versicolor  7.8
72           4.0         1.3 versicolor  7.0
73           4.9         1.5 versicolor  7.9
74           4.7         1.2 versicolor  7.7
75           4.3         1.3 versicolor  7.3
76           4.4         1.4 versicolor  7.4
77           4.8         1.4 versicolor  7.8
78           5.0         1.7 versicolor  8.0
79           4.5         1.5 versicolor  7.5
80           3.5         1.0 versicolor  6.5
81           3.8         1.1 versicolor  6.8
82           3.7         1.0 versicolor  6.7
83           3.9         1.2 versicolor  6.9
84           5.1         1.6 versicolor  8.1
85           4.5         1.5 versicolor  7.5
86           4.5         1.6 versicolor  7.5
87           4.7         1.5 versicolor  7.7
88           4.4         1.3 versicolor  7.4
89           4.1         1.3 versicolor  7.1
90           4.0         1.3 versicolor  7.0
91           4.4         1.2 versicolor  7.4
92           4.6         1.4 versicolor  7.6
93           4.0         1.2 versicolor  7.0
94           3.3         1.0 versicolor  6.3
95           4.2         1.3 versicolor  7.2
96           4.2         1.2 versicolor  7.2
97           4.2         1.3 versicolor  7.2
98           4.3         1.3 versicolor  7.3
99           3.0         1.1 versicolor  6.0
100          4.1         1.3 versicolor  7.1
101          6.0         2.5  virginica  9.0
102          5.1         1.9  virginica  8.1
103          5.9         2.1  virginica  8.9
104          5.6         1.8  virginica  8.6
105          5.8         2.2  virginica  8.8
106          6.6         2.1  virginica  9.6
107          4.5         1.7  virginica  7.5
108          6.3         1.8  virginica  9.3
109          5.8         1.8  virginica  8.8
110          6.1         2.5  virginica  9.1
111          5.1         2.0  virginica  8.1
112          5.3         1.9  virginica  8.3
113          5.5         2.1  virginica  8.5
114          5.0         2.0  virginica  8.0
115          5.1         2.4  virginica  8.1
116          5.3         2.3  virginica  8.3
117          5.5         1.8  virginica  8.5
118          6.7         2.2  virginica  9.7
119          6.9         2.3  virginica  9.9
120          5.0         1.5  virginica  8.0
121          5.7         2.3  virginica  8.7
122          4.9         2.0  virginica  7.9
123          6.7         2.0  virginica  9.7
124          4.9         1.8  virginica  7.9
125          5.7         2.1  virginica  8.7
126          6.0         1.8  virginica  9.0
127          4.8         1.8  virginica  7.8
128          4.9         1.8  virginica  7.9
129          5.6         2.1  virginica  8.6
130          5.8         1.6  virginica  8.8
131          6.1         1.9  virginica  9.1
132          6.4         2.0  virginica  9.4
133          5.6         2.2  virginica  8.6
134          5.1         1.5  virginica  8.1
135          5.6         1.4  virginica  8.6
136          6.1         2.3  virginica  9.1
137          5.6         2.4  virginica  8.6
138          5.5         1.8  virginica  8.5
139          4.8         1.8  virginica  7.8
140          5.4         2.1  virginica  8.4
141          5.6         2.4  virginica  8.6
142          5.1         2.3  virginica  8.1
143          5.1         1.9  virginica  8.1
144          5.9         2.3  virginica  8.9
145          5.7         2.5  virginica  8.7
146          5.2         2.3  virginica  8.2
147          5.0         1.9  virginica  8.0
148          5.2         2.0  virginica  8.2
149          5.4         2.3  virginica  8.4
150          5.1         1.8  virginica  8.1
```

dplyr - mutate()
========================================================


```r
mutate(iris2, Area = Petal.Length*Petal.Width)
```

```
    Petal.Length Petal.Width    Species  Area
1            1.4         0.2     setosa  0.28
2            1.4         0.2     setosa  0.28
3            1.3         0.2     setosa  0.26
4            1.5         0.2     setosa  0.30
5            1.4         0.2     setosa  0.28
6            1.7         0.4     setosa  0.68
7            1.4         0.3     setosa  0.42
8            1.5         0.2     setosa  0.30
9            1.4         0.2     setosa  0.28
10           1.5         0.1     setosa  0.15
11           1.5         0.2     setosa  0.30
12           1.6         0.2     setosa  0.32
13           1.4         0.1     setosa  0.14
14           1.1         0.1     setosa  0.11
15           1.2         0.2     setosa  0.24
16           1.5         0.4     setosa  0.60
17           1.3         0.4     setosa  0.52
18           1.4         0.3     setosa  0.42
19           1.7         0.3     setosa  0.51
20           1.5         0.3     setosa  0.45
21           1.7         0.2     setosa  0.34
22           1.5         0.4     setosa  0.60
23           1.0         0.2     setosa  0.20
24           1.7         0.5     setosa  0.85
25           1.9         0.2     setosa  0.38
26           1.6         0.2     setosa  0.32
27           1.6         0.4     setosa  0.64
28           1.5         0.2     setosa  0.30
29           1.4         0.2     setosa  0.28
30           1.6         0.2     setosa  0.32
31           1.6         0.2     setosa  0.32
32           1.5         0.4     setosa  0.60
33           1.5         0.1     setosa  0.15
34           1.4         0.2     setosa  0.28
35           1.5         0.2     setosa  0.30
36           1.2         0.2     setosa  0.24
37           1.3         0.2     setosa  0.26
38           1.4         0.1     setosa  0.14
39           1.3         0.2     setosa  0.26
40           1.5         0.2     setosa  0.30
41           1.3         0.3     setosa  0.39
42           1.3         0.3     setosa  0.39
43           1.3         0.2     setosa  0.26
44           1.6         0.6     setosa  0.96
45           1.9         0.4     setosa  0.76
46           1.4         0.3     setosa  0.42
47           1.6         0.2     setosa  0.32
48           1.4         0.2     setosa  0.28
49           1.5         0.2     setosa  0.30
50           1.4         0.2     setosa  0.28
51           4.7         1.4 versicolor  6.58
52           4.5         1.5 versicolor  6.75
53           4.9         1.5 versicolor  7.35
54           4.0         1.3 versicolor  5.20
55           4.6         1.5 versicolor  6.90
56           4.5         1.3 versicolor  5.85
57           4.7         1.6 versicolor  7.52
58           3.3         1.0 versicolor  3.30
59           4.6         1.3 versicolor  5.98
60           3.9         1.4 versicolor  5.46
61           3.5         1.0 versicolor  3.50
62           4.2         1.5 versicolor  6.30
63           4.0         1.0 versicolor  4.00
64           4.7         1.4 versicolor  6.58
65           3.6         1.3 versicolor  4.68
66           4.4         1.4 versicolor  6.16
67           4.5         1.5 versicolor  6.75
68           4.1         1.0 versicolor  4.10
69           4.5         1.5 versicolor  6.75
70           3.9         1.1 versicolor  4.29
71           4.8         1.8 versicolor  8.64
72           4.0         1.3 versicolor  5.20
73           4.9         1.5 versicolor  7.35
74           4.7         1.2 versicolor  5.64
75           4.3         1.3 versicolor  5.59
76           4.4         1.4 versicolor  6.16
77           4.8         1.4 versicolor  6.72
78           5.0         1.7 versicolor  8.50
79           4.5         1.5 versicolor  6.75
80           3.5         1.0 versicolor  3.50
81           3.8         1.1 versicolor  4.18
82           3.7         1.0 versicolor  3.70
83           3.9         1.2 versicolor  4.68
84           5.1         1.6 versicolor  8.16
85           4.5         1.5 versicolor  6.75
86           4.5         1.6 versicolor  7.20
87           4.7         1.5 versicolor  7.05
88           4.4         1.3 versicolor  5.72
89           4.1         1.3 versicolor  5.33
90           4.0         1.3 versicolor  5.20
91           4.4         1.2 versicolor  5.28
92           4.6         1.4 versicolor  6.44
93           4.0         1.2 versicolor  4.80
94           3.3         1.0 versicolor  3.30
95           4.2         1.3 versicolor  5.46
96           4.2         1.2 versicolor  5.04
97           4.2         1.3 versicolor  5.46
98           4.3         1.3 versicolor  5.59
99           3.0         1.1 versicolor  3.30
100          4.1         1.3 versicolor  5.33
101          6.0         2.5  virginica 15.00
102          5.1         1.9  virginica  9.69
103          5.9         2.1  virginica 12.39
104          5.6         1.8  virginica 10.08
105          5.8         2.2  virginica 12.76
106          6.6         2.1  virginica 13.86
107          4.5         1.7  virginica  7.65
108          6.3         1.8  virginica 11.34
109          5.8         1.8  virginica 10.44
110          6.1         2.5  virginica 15.25
111          5.1         2.0  virginica 10.20
112          5.3         1.9  virginica 10.07
113          5.5         2.1  virginica 11.55
114          5.0         2.0  virginica 10.00
115          5.1         2.4  virginica 12.24
116          5.3         2.3  virginica 12.19
117          5.5         1.8  virginica  9.90
118          6.7         2.2  virginica 14.74
119          6.9         2.3  virginica 15.87
120          5.0         1.5  virginica  7.50
121          5.7         2.3  virginica 13.11
122          4.9         2.0  virginica  9.80
123          6.7         2.0  virginica 13.40
124          4.9         1.8  virginica  8.82
125          5.7         2.1  virginica 11.97
126          6.0         1.8  virginica 10.80
127          4.8         1.8  virginica  8.64
128          4.9         1.8  virginica  8.82
129          5.6         2.1  virginica 11.76
130          5.8         1.6  virginica  9.28
131          6.1         1.9  virginica 11.59
132          6.4         2.0  virginica 12.80
133          5.6         2.2  virginica 12.32
134          5.1         1.5  virginica  7.65
135          5.6         1.4  virginica  7.84
136          6.1         2.3  virginica 14.03
137          5.6         2.4  virginica 13.44
138          5.5         1.8  virginica  9.90
139          4.8         1.8  virginica  8.64
140          5.4         2.1  virginica 11.34
141          5.6         2.4  virginica 13.44
142          5.1         2.3  virginica 11.73
143          5.1         1.9  virginica  9.69
144          5.9         2.3  virginica 13.57
145          5.7         2.5  virginica 14.25
146          5.2         2.3  virginica 11.96
147          5.0         1.9  virginica  9.50
148          5.2         2.0  virginica 10.40
149          5.4         2.3  virginica 12.42
150          5.1         1.8  virginica  9.18
```

dplyr - summarise()/summarize()
========================================================

To create summary statistics of the entire dataset, use summarise():


```r
summarise(iris,
          total.flowers = n(),
          avg.P.Length = mean(Petal.Length),
          sd.P.Width = sd(Petal.Width))
```

```
  total.flowers avg.P.Length sd.P.Width
1           150        3.758  0.7622377
```

dplyr - group_by()/summarise()
========================================================

Use group_by() along with summarise() to find summary statistics by group:


```r
iris %>%
    group_by(Species) %>%
    summarise(total.flowers = n(),
              avg.P.L = mean(Petal.Length))
```

```
Source: local data frame [3 x 3]

     Species total.flowers avg.P.L
1     setosa            50   1.462
2 versicolor            50   4.260
3  virginica            50   5.552
```

dplyr - group_by()/mutate()
========================================================

Use group_by() along with mutate() to find running stats by group:


```r
iris %>%
    sample_n(6) %>%
    select(Petal.Length, Species) %>%
    group_by(Species) %>%
    mutate(cumsum(Petal.Length))
```

```
Source: local data frame [6 x 3]
Groups: Species

  Petal.Length    Species cumsum(Petal.Length)
1          1.4     setosa                  1.4
2          5.5  virginica                  5.5
3          4.5 versicolor                  4.5
4          1.3     setosa                  2.7
5          4.3 versicolor                  8.8
6          4.9 versicolor                 13.7
```

dplyr - combining datasets
========================================================

Sometimes you have two datasets that you want to merge, such as "a"...


```r
a <- data_frame(x1 = c("A", "B", "C"),
                x2 = c(1,2,3))
a
```

```
Source: local data frame [3 x 2]

  x1 x2
1  A  1
2  B  2
3  C  3
```

dplyr - combining datasets
========================================================

and "b".


```r
b <- data_frame(x1 = c("A", "B", "D"),
                x3 = c(T,F,T))
b
```

```
Source: local data frame [3 x 2]

  x1    x3
1  A  TRUE
2  B FALSE
3  D  TRUE
```

dplyr - left_join()
========================================================

left_join() keeps everything in "a" and only matching values in "b".


```r
left_join(a,b)
```

```
Source: local data frame [3 x 3]

  x1 x2    x3
1  A  1  TRUE
2  B  2 FALSE
3  C  3    NA
```

dplyr - right_join()
========================================================

right_join() keeps everything in "b" and only matching values in "a".


```r
right_join(a,b)
```

```
Source: local data frame [3 x 3]

  x1 x2    x3
1  A  1  TRUE
2  B  2 FALSE
3  D NA  TRUE
```

dplyr - inner_join()
========================================================

inner_join() keeps everything that matches in "a" and "b".


```r
inner_join(a,b)
```

```
Source: local data frame [2 x 3]

  x1 x2    x3
1  A  1  TRUE
2  B  2 FALSE
```

dplyr - full_join()
========================================================

full_join() keeps everything in "a" and "b".


```r
full_join(a,b)
```

```
Source: local data frame [4 x 3]

  x1 x2    x3
1  A  1  TRUE
2  B  2 FALSE
3  C  3    NA
4  D NA  TRUE
```

tidyr - gather()
========================================================

If your variables are measured by common units, then it may make sense to make one column for variable name and another for the metric. For this we use gather() from the tidyr package:


```r
library(tidyr)
gather(iris, "measure", "cm", 1:4)
```

```
       Species      measure  cm
1       setosa Sepal.Length 5.1
2       setosa Sepal.Length 4.9
3       setosa Sepal.Length 4.7
4       setosa Sepal.Length 4.6
5       setosa Sepal.Length 5.0
6       setosa Sepal.Length 5.4
7       setosa Sepal.Length 4.6
8       setosa Sepal.Length 5.0
9       setosa Sepal.Length 4.4
10      setosa Sepal.Length 4.9
11      setosa Sepal.Length 5.4
12      setosa Sepal.Length 4.8
13      setosa Sepal.Length 4.8
14      setosa Sepal.Length 4.3
15      setosa Sepal.Length 5.8
16      setosa Sepal.Length 5.7
17      setosa Sepal.Length 5.4
18      setosa Sepal.Length 5.1
19      setosa Sepal.Length 5.7
20      setosa Sepal.Length 5.1
21      setosa Sepal.Length 5.4
22      setosa Sepal.Length 5.1
23      setosa Sepal.Length 4.6
24      setosa Sepal.Length 5.1
25      setosa Sepal.Length 4.8
26      setosa Sepal.Length 5.0
27      setosa Sepal.Length 5.0
28      setosa Sepal.Length 5.2
29      setosa Sepal.Length 5.2
30      setosa Sepal.Length 4.7
31      setosa Sepal.Length 4.8
32      setosa Sepal.Length 5.4
33      setosa Sepal.Length 5.2
34      setosa Sepal.Length 5.5
35      setosa Sepal.Length 4.9
36      setosa Sepal.Length 5.0
37      setosa Sepal.Length 5.5
38      setosa Sepal.Length 4.9
39      setosa Sepal.Length 4.4
40      setosa Sepal.Length 5.1
41      setosa Sepal.Length 5.0
42      setosa Sepal.Length 4.5
43      setosa Sepal.Length 4.4
44      setosa Sepal.Length 5.0
45      setosa Sepal.Length 5.1
46      setosa Sepal.Length 4.8
47      setosa Sepal.Length 5.1
48      setosa Sepal.Length 4.6
49      setosa Sepal.Length 5.3
50      setosa Sepal.Length 5.0
51  versicolor Sepal.Length 7.0
52  versicolor Sepal.Length 6.4
53  versicolor Sepal.Length 6.9
54  versicolor Sepal.Length 5.5
55  versicolor Sepal.Length 6.5
56  versicolor Sepal.Length 5.7
57  versicolor Sepal.Length 6.3
58  versicolor Sepal.Length 4.9
59  versicolor Sepal.Length 6.6
60  versicolor Sepal.Length 5.2
61  versicolor Sepal.Length 5.0
62  versicolor Sepal.Length 5.9
63  versicolor Sepal.Length 6.0
64  versicolor Sepal.Length 6.1
65  versicolor Sepal.Length 5.6
66  versicolor Sepal.Length 6.7
67  versicolor Sepal.Length 5.6
68  versicolor Sepal.Length 5.8
69  versicolor Sepal.Length 6.2
70  versicolor Sepal.Length 5.6
71  versicolor Sepal.Length 5.9
72  versicolor Sepal.Length 6.1
73  versicolor Sepal.Length 6.3
74  versicolor Sepal.Length 6.1
75  versicolor Sepal.Length 6.4
76  versicolor Sepal.Length 6.6
77  versicolor Sepal.Length 6.8
78  versicolor Sepal.Length 6.7
79  versicolor Sepal.Length 6.0
80  versicolor Sepal.Length 5.7
81  versicolor Sepal.Length 5.5
82  versicolor Sepal.Length 5.5
83  versicolor Sepal.Length 5.8
84  versicolor Sepal.Length 6.0
85  versicolor Sepal.Length 5.4
86  versicolor Sepal.Length 6.0
87  versicolor Sepal.Length 6.7
88  versicolor Sepal.Length 6.3
89  versicolor Sepal.Length 5.6
90  versicolor Sepal.Length 5.5
91  versicolor Sepal.Length 5.5
92  versicolor Sepal.Length 6.1
93  versicolor Sepal.Length 5.8
94  versicolor Sepal.Length 5.0
95  versicolor Sepal.Length 5.6
96  versicolor Sepal.Length 5.7
97  versicolor Sepal.Length 5.7
98  versicolor Sepal.Length 6.2
99  versicolor Sepal.Length 5.1
100 versicolor Sepal.Length 5.7
101  virginica Sepal.Length 6.3
102  virginica Sepal.Length 5.8
103  virginica Sepal.Length 7.1
104  virginica Sepal.Length 6.3
105  virginica Sepal.Length 6.5
106  virginica Sepal.Length 7.6
107  virginica Sepal.Length 4.9
108  virginica Sepal.Length 7.3
109  virginica Sepal.Length 6.7
110  virginica Sepal.Length 7.2
111  virginica Sepal.Length 6.5
112  virginica Sepal.Length 6.4
113  virginica Sepal.Length 6.8
114  virginica Sepal.Length 5.7
115  virginica Sepal.Length 5.8
116  virginica Sepal.Length 6.4
117  virginica Sepal.Length 6.5
118  virginica Sepal.Length 7.7
119  virginica Sepal.Length 7.7
120  virginica Sepal.Length 6.0
121  virginica Sepal.Length 6.9
122  virginica Sepal.Length 5.6
123  virginica Sepal.Length 7.7
124  virginica Sepal.Length 6.3
125  virginica Sepal.Length 6.7
126  virginica Sepal.Length 7.2
127  virginica Sepal.Length 6.2
128  virginica Sepal.Length 6.1
129  virginica Sepal.Length 6.4
130  virginica Sepal.Length 7.2
131  virginica Sepal.Length 7.4
132  virginica Sepal.Length 7.9
133  virginica Sepal.Length 6.4
134  virginica Sepal.Length 6.3
135  virginica Sepal.Length 6.1
136  virginica Sepal.Length 7.7
137  virginica Sepal.Length 6.3
138  virginica Sepal.Length 6.4
139  virginica Sepal.Length 6.0
140  virginica Sepal.Length 6.9
141  virginica Sepal.Length 6.7
142  virginica Sepal.Length 6.9
143  virginica Sepal.Length 5.8
144  virginica Sepal.Length 6.8
145  virginica Sepal.Length 6.7
146  virginica Sepal.Length 6.7
147  virginica Sepal.Length 6.3
148  virginica Sepal.Length 6.5
149  virginica Sepal.Length 6.2
150  virginica Sepal.Length 5.9
151     setosa  Sepal.Width 3.5
152     setosa  Sepal.Width 3.0
153     setosa  Sepal.Width 3.2
154     setosa  Sepal.Width 3.1
155     setosa  Sepal.Width 3.6
156     setosa  Sepal.Width 3.9
157     setosa  Sepal.Width 3.4
158     setosa  Sepal.Width 3.4
159     setosa  Sepal.Width 2.9
160     setosa  Sepal.Width 3.1
161     setosa  Sepal.Width 3.7
162     setosa  Sepal.Width 3.4
163     setosa  Sepal.Width 3.0
164     setosa  Sepal.Width 3.0
165     setosa  Sepal.Width 4.0
166     setosa  Sepal.Width 4.4
167     setosa  Sepal.Width 3.9
168     setosa  Sepal.Width 3.5
169     setosa  Sepal.Width 3.8
170     setosa  Sepal.Width 3.8
171     setosa  Sepal.Width 3.4
172     setosa  Sepal.Width 3.7
173     setosa  Sepal.Width 3.6
174     setosa  Sepal.Width 3.3
175     setosa  Sepal.Width 3.4
176     setosa  Sepal.Width 3.0
177     setosa  Sepal.Width 3.4
178     setosa  Sepal.Width 3.5
179     setosa  Sepal.Width 3.4
180     setosa  Sepal.Width 3.2
181     setosa  Sepal.Width 3.1
182     setosa  Sepal.Width 3.4
183     setosa  Sepal.Width 4.1
184     setosa  Sepal.Width 4.2
185     setosa  Sepal.Width 3.1
186     setosa  Sepal.Width 3.2
187     setosa  Sepal.Width 3.5
188     setosa  Sepal.Width 3.6
189     setosa  Sepal.Width 3.0
190     setosa  Sepal.Width 3.4
191     setosa  Sepal.Width 3.5
192     setosa  Sepal.Width 2.3
193     setosa  Sepal.Width 3.2
194     setosa  Sepal.Width 3.5
195     setosa  Sepal.Width 3.8
196     setosa  Sepal.Width 3.0
197     setosa  Sepal.Width 3.8
198     setosa  Sepal.Width 3.2
199     setosa  Sepal.Width 3.7
200     setosa  Sepal.Width 3.3
201 versicolor  Sepal.Width 3.2
202 versicolor  Sepal.Width 3.2
203 versicolor  Sepal.Width 3.1
204 versicolor  Sepal.Width 2.3
205 versicolor  Sepal.Width 2.8
206 versicolor  Sepal.Width 2.8
207 versicolor  Sepal.Width 3.3
208 versicolor  Sepal.Width 2.4
209 versicolor  Sepal.Width 2.9
210 versicolor  Sepal.Width 2.7
211 versicolor  Sepal.Width 2.0
212 versicolor  Sepal.Width 3.0
213 versicolor  Sepal.Width 2.2
214 versicolor  Sepal.Width 2.9
215 versicolor  Sepal.Width 2.9
216 versicolor  Sepal.Width 3.1
217 versicolor  Sepal.Width 3.0
218 versicolor  Sepal.Width 2.7
219 versicolor  Sepal.Width 2.2
220 versicolor  Sepal.Width 2.5
221 versicolor  Sepal.Width 3.2
222 versicolor  Sepal.Width 2.8
223 versicolor  Sepal.Width 2.5
224 versicolor  Sepal.Width 2.8
225 versicolor  Sepal.Width 2.9
226 versicolor  Sepal.Width 3.0
227 versicolor  Sepal.Width 2.8
228 versicolor  Sepal.Width 3.0
229 versicolor  Sepal.Width 2.9
230 versicolor  Sepal.Width 2.6
231 versicolor  Sepal.Width 2.4
232 versicolor  Sepal.Width 2.4
233 versicolor  Sepal.Width 2.7
234 versicolor  Sepal.Width 2.7
235 versicolor  Sepal.Width 3.0
236 versicolor  Sepal.Width 3.4
237 versicolor  Sepal.Width 3.1
238 versicolor  Sepal.Width 2.3
239 versicolor  Sepal.Width 3.0
240 versicolor  Sepal.Width 2.5
241 versicolor  Sepal.Width 2.6
242 versicolor  Sepal.Width 3.0
243 versicolor  Sepal.Width 2.6
244 versicolor  Sepal.Width 2.3
245 versicolor  Sepal.Width 2.7
246 versicolor  Sepal.Width 3.0
247 versicolor  Sepal.Width 2.9
248 versicolor  Sepal.Width 2.9
249 versicolor  Sepal.Width 2.5
250 versicolor  Sepal.Width 2.8
251  virginica  Sepal.Width 3.3
252  virginica  Sepal.Width 2.7
253  virginica  Sepal.Width 3.0
254  virginica  Sepal.Width 2.9
255  virginica  Sepal.Width 3.0
256  virginica  Sepal.Width 3.0
257  virginica  Sepal.Width 2.5
258  virginica  Sepal.Width 2.9
259  virginica  Sepal.Width 2.5
260  virginica  Sepal.Width 3.6
261  virginica  Sepal.Width 3.2
262  virginica  Sepal.Width 2.7
263  virginica  Sepal.Width 3.0
264  virginica  Sepal.Width 2.5
265  virginica  Sepal.Width 2.8
266  virginica  Sepal.Width 3.2
267  virginica  Sepal.Width 3.0
268  virginica  Sepal.Width 3.8
269  virginica  Sepal.Width 2.6
270  virginica  Sepal.Width 2.2
271  virginica  Sepal.Width 3.2
272  virginica  Sepal.Width 2.8
273  virginica  Sepal.Width 2.8
274  virginica  Sepal.Width 2.7
275  virginica  Sepal.Width 3.3
276  virginica  Sepal.Width 3.2
277  virginica  Sepal.Width 2.8
278  virginica  Sepal.Width 3.0
279  virginica  Sepal.Width 2.8
280  virginica  Sepal.Width 3.0
281  virginica  Sepal.Width 2.8
282  virginica  Sepal.Width 3.8
283  virginica  Sepal.Width 2.8
284  virginica  Sepal.Width 2.8
285  virginica  Sepal.Width 2.6
286  virginica  Sepal.Width 3.0
287  virginica  Sepal.Width 3.4
288  virginica  Sepal.Width 3.1
289  virginica  Sepal.Width 3.0
290  virginica  Sepal.Width 3.1
291  virginica  Sepal.Width 3.1
292  virginica  Sepal.Width 3.1
293  virginica  Sepal.Width 2.7
294  virginica  Sepal.Width 3.2
295  virginica  Sepal.Width 3.3
296  virginica  Sepal.Width 3.0
297  virginica  Sepal.Width 2.5
298  virginica  Sepal.Width 3.0
299  virginica  Sepal.Width 3.4
300  virginica  Sepal.Width 3.0
301     setosa Petal.Length 1.4
302     setosa Petal.Length 1.4
303     setosa Petal.Length 1.3
304     setosa Petal.Length 1.5
305     setosa Petal.Length 1.4
306     setosa Petal.Length 1.7
307     setosa Petal.Length 1.4
308     setosa Petal.Length 1.5
309     setosa Petal.Length 1.4
310     setosa Petal.Length 1.5
311     setosa Petal.Length 1.5
312     setosa Petal.Length 1.6
313     setosa Petal.Length 1.4
314     setosa Petal.Length 1.1
315     setosa Petal.Length 1.2
316     setosa Petal.Length 1.5
317     setosa Petal.Length 1.3
318     setosa Petal.Length 1.4
319     setosa Petal.Length 1.7
320     setosa Petal.Length 1.5
321     setosa Petal.Length 1.7
322     setosa Petal.Length 1.5
323     setosa Petal.Length 1.0
324     setosa Petal.Length 1.7
325     setosa Petal.Length 1.9
326     setosa Petal.Length 1.6
327     setosa Petal.Length 1.6
328     setosa Petal.Length 1.5
329     setosa Petal.Length 1.4
330     setosa Petal.Length 1.6
331     setosa Petal.Length 1.6
332     setosa Petal.Length 1.5
333     setosa Petal.Length 1.5
334     setosa Petal.Length 1.4
335     setosa Petal.Length 1.5
336     setosa Petal.Length 1.2
337     setosa Petal.Length 1.3
338     setosa Petal.Length 1.4
339     setosa Petal.Length 1.3
340     setosa Petal.Length 1.5
341     setosa Petal.Length 1.3
342     setosa Petal.Length 1.3
343     setosa Petal.Length 1.3
344     setosa Petal.Length 1.6
345     setosa Petal.Length 1.9
346     setosa Petal.Length 1.4
347     setosa Petal.Length 1.6
348     setosa Petal.Length 1.4
349     setosa Petal.Length 1.5
350     setosa Petal.Length 1.4
351 versicolor Petal.Length 4.7
352 versicolor Petal.Length 4.5
353 versicolor Petal.Length 4.9
354 versicolor Petal.Length 4.0
355 versicolor Petal.Length 4.6
356 versicolor Petal.Length 4.5
357 versicolor Petal.Length 4.7
358 versicolor Petal.Length 3.3
359 versicolor Petal.Length 4.6
360 versicolor Petal.Length 3.9
361 versicolor Petal.Length 3.5
362 versicolor Petal.Length 4.2
363 versicolor Petal.Length 4.0
364 versicolor Petal.Length 4.7
365 versicolor Petal.Length 3.6
366 versicolor Petal.Length 4.4
367 versicolor Petal.Length 4.5
368 versicolor Petal.Length 4.1
369 versicolor Petal.Length 4.5
370 versicolor Petal.Length 3.9
371 versicolor Petal.Length 4.8
372 versicolor Petal.Length 4.0
373 versicolor Petal.Length 4.9
374 versicolor Petal.Length 4.7
375 versicolor Petal.Length 4.3
376 versicolor Petal.Length 4.4
377 versicolor Petal.Length 4.8
378 versicolor Petal.Length 5.0
379 versicolor Petal.Length 4.5
380 versicolor Petal.Length 3.5
381 versicolor Petal.Length 3.8
382 versicolor Petal.Length 3.7
383 versicolor Petal.Length 3.9
384 versicolor Petal.Length 5.1
385 versicolor Petal.Length 4.5
386 versicolor Petal.Length 4.5
387 versicolor Petal.Length 4.7
388 versicolor Petal.Length 4.4
389 versicolor Petal.Length 4.1
390 versicolor Petal.Length 4.0
391 versicolor Petal.Length 4.4
392 versicolor Petal.Length 4.6
393 versicolor Petal.Length 4.0
394 versicolor Petal.Length 3.3
395 versicolor Petal.Length 4.2
396 versicolor Petal.Length 4.2
397 versicolor Petal.Length 4.2
398 versicolor Petal.Length 4.3
399 versicolor Petal.Length 3.0
400 versicolor Petal.Length 4.1
401  virginica Petal.Length 6.0
402  virginica Petal.Length 5.1
403  virginica Petal.Length 5.9
404  virginica Petal.Length 5.6
405  virginica Petal.Length 5.8
406  virginica Petal.Length 6.6
407  virginica Petal.Length 4.5
408  virginica Petal.Length 6.3
409  virginica Petal.Length 5.8
410  virginica Petal.Length 6.1
411  virginica Petal.Length 5.1
412  virginica Petal.Length 5.3
413  virginica Petal.Length 5.5
414  virginica Petal.Length 5.0
415  virginica Petal.Length 5.1
416  virginica Petal.Length 5.3
417  virginica Petal.Length 5.5
418  virginica Petal.Length 6.7
419  virginica Petal.Length 6.9
420  virginica Petal.Length 5.0
421  virginica Petal.Length 5.7
422  virginica Petal.Length 4.9
423  virginica Petal.Length 6.7
424  virginica Petal.Length 4.9
425  virginica Petal.Length 5.7
426  virginica Petal.Length 6.0
427  virginica Petal.Length 4.8
428  virginica Petal.Length 4.9
429  virginica Petal.Length 5.6
430  virginica Petal.Length 5.8
431  virginica Petal.Length 6.1
432  virginica Petal.Length 6.4
433  virginica Petal.Length 5.6
434  virginica Petal.Length 5.1
435  virginica Petal.Length 5.6
436  virginica Petal.Length 6.1
437  virginica Petal.Length 5.6
438  virginica Petal.Length 5.5
439  virginica Petal.Length 4.8
440  virginica Petal.Length 5.4
441  virginica Petal.Length 5.6
442  virginica Petal.Length 5.1
443  virginica Petal.Length 5.1
444  virginica Petal.Length 5.9
445  virginica Petal.Length 5.7
446  virginica Petal.Length 5.2
447  virginica Petal.Length 5.0
448  virginica Petal.Length 5.2
449  virginica Petal.Length 5.4
450  virginica Petal.Length 5.1
451     setosa  Petal.Width 0.2
452     setosa  Petal.Width 0.2
453     setosa  Petal.Width 0.2
454     setosa  Petal.Width 0.2
455     setosa  Petal.Width 0.2
456     setosa  Petal.Width 0.4
457     setosa  Petal.Width 0.3
458     setosa  Petal.Width 0.2
459     setosa  Petal.Width 0.2
460     setosa  Petal.Width 0.1
461     setosa  Petal.Width 0.2
462     setosa  Petal.Width 0.2
463     setosa  Petal.Width 0.1
464     setosa  Petal.Width 0.1
465     setosa  Petal.Width 0.2
466     setosa  Petal.Width 0.4
467     setosa  Petal.Width 0.4
468     setosa  Petal.Width 0.3
469     setosa  Petal.Width 0.3
470     setosa  Petal.Width 0.3
471     setosa  Petal.Width 0.2
472     setosa  Petal.Width 0.4
473     setosa  Petal.Width 0.2
474     setosa  Petal.Width 0.5
475     setosa  Petal.Width 0.2
476     setosa  Petal.Width 0.2
477     setosa  Petal.Width 0.4
478     setosa  Petal.Width 0.2
479     setosa  Petal.Width 0.2
480     setosa  Petal.Width 0.2
481     setosa  Petal.Width 0.2
482     setosa  Petal.Width 0.4
483     setosa  Petal.Width 0.1
484     setosa  Petal.Width 0.2
485     setosa  Petal.Width 0.2
486     setosa  Petal.Width 0.2
487     setosa  Petal.Width 0.2
488     setosa  Petal.Width 0.1
489     setosa  Petal.Width 0.2
490     setosa  Petal.Width 0.2
491     setosa  Petal.Width 0.3
492     setosa  Petal.Width 0.3
493     setosa  Petal.Width 0.2
494     setosa  Petal.Width 0.6
495     setosa  Petal.Width 0.4
496     setosa  Petal.Width 0.3
497     setosa  Petal.Width 0.2
498     setosa  Petal.Width 0.2
499     setosa  Petal.Width 0.2
500     setosa  Petal.Width 0.2
501 versicolor  Petal.Width 1.4
502 versicolor  Petal.Width 1.5
503 versicolor  Petal.Width 1.5
504 versicolor  Petal.Width 1.3
505 versicolor  Petal.Width 1.5
506 versicolor  Petal.Width 1.3
507 versicolor  Petal.Width 1.6
508 versicolor  Petal.Width 1.0
509 versicolor  Petal.Width 1.3
510 versicolor  Petal.Width 1.4
511 versicolor  Petal.Width 1.0
512 versicolor  Petal.Width 1.5
513 versicolor  Petal.Width 1.0
514 versicolor  Petal.Width 1.4
515 versicolor  Petal.Width 1.3
516 versicolor  Petal.Width 1.4
517 versicolor  Petal.Width 1.5
518 versicolor  Petal.Width 1.0
519 versicolor  Petal.Width 1.5
520 versicolor  Petal.Width 1.1
521 versicolor  Petal.Width 1.8
522 versicolor  Petal.Width 1.3
523 versicolor  Petal.Width 1.5
524 versicolor  Petal.Width 1.2
525 versicolor  Petal.Width 1.3
526 versicolor  Petal.Width 1.4
527 versicolor  Petal.Width 1.4
528 versicolor  Petal.Width 1.7
529 versicolor  Petal.Width 1.5
530 versicolor  Petal.Width 1.0
531 versicolor  Petal.Width 1.1
532 versicolor  Petal.Width 1.0
533 versicolor  Petal.Width 1.2
534 versicolor  Petal.Width 1.6
535 versicolor  Petal.Width 1.5
536 versicolor  Petal.Width 1.6
537 versicolor  Petal.Width 1.5
538 versicolor  Petal.Width 1.3
539 versicolor  Petal.Width 1.3
540 versicolor  Petal.Width 1.3
541 versicolor  Petal.Width 1.2
542 versicolor  Petal.Width 1.4
543 versicolor  Petal.Width 1.2
544 versicolor  Petal.Width 1.0
545 versicolor  Petal.Width 1.3
546 versicolor  Petal.Width 1.2
547 versicolor  Petal.Width 1.3
548 versicolor  Petal.Width 1.3
549 versicolor  Petal.Width 1.1
550 versicolor  Petal.Width 1.3
551  virginica  Petal.Width 2.5
552  virginica  Petal.Width 1.9
553  virginica  Petal.Width 2.1
554  virginica  Petal.Width 1.8
555  virginica  Petal.Width 2.2
556  virginica  Petal.Width 2.1
557  virginica  Petal.Width 1.7
558  virginica  Petal.Width 1.8
559  virginica  Petal.Width 1.8
560  virginica  Petal.Width 2.5
561  virginica  Petal.Width 2.0
562  virginica  Petal.Width 1.9
563  virginica  Petal.Width 2.1
564  virginica  Petal.Width 2.0
565  virginica  Petal.Width 2.4
566  virginica  Petal.Width 2.3
567  virginica  Petal.Width 1.8
568  virginica  Petal.Width 2.2
569  virginica  Petal.Width 2.3
570  virginica  Petal.Width 1.5
571  virginica  Petal.Width 2.3
572  virginica  Petal.Width 2.0
573  virginica  Petal.Width 2.0
574  virginica  Petal.Width 1.8
575  virginica  Petal.Width 2.1
576  virginica  Petal.Width 1.8
577  virginica  Petal.Width 1.8
578  virginica  Petal.Width 1.8
579  virginica  Petal.Width 2.1
580  virginica  Petal.Width 1.6
581  virginica  Petal.Width 1.9
582  virginica  Petal.Width 2.0
583  virginica  Petal.Width 2.2
584  virginica  Petal.Width 1.5
585  virginica  Petal.Width 1.4
586  virginica  Petal.Width 2.3
587  virginica  Petal.Width 2.4
588  virginica  Petal.Width 1.8
589  virginica  Petal.Width 1.8
590  virginica  Petal.Width 2.1
591  virginica  Petal.Width 2.4
592  virginica  Petal.Width 2.3
593  virginica  Petal.Width 1.9
594  virginica  Petal.Width 2.3
595  virginica  Petal.Width 2.5
596  virginica  Petal.Width 2.3
597  virginica  Petal.Width 1.9
598  virginica  Petal.Width 2.0
599  virginica  Petal.Width 2.3
600  virginica  Petal.Width 1.8
```

tidyr - spread()
========================================================

To undo this, use spread() [each row must be unique for this to work]:


```r
gatherd_iris <- iris %>%
    mutate(id = seq(1,150)) %>%
    gather("measure", "cm", 1:4)
spread(gatherd_iris, measure, cm) %>%
    select(id, Species, starts_with("Sepal"))
```

```
     id    Species Sepal.Length Sepal.Width
1     1     setosa          5.1         3.5
2     2     setosa          4.9         3.0
3     3     setosa          4.7         3.2
4     4     setosa          4.6         3.1
5     5     setosa          5.0         3.6
6     6     setosa          5.4         3.9
7     7     setosa          4.6         3.4
8     8     setosa          5.0         3.4
9     9     setosa          4.4         2.9
10   10     setosa          4.9         3.1
11   11     setosa          5.4         3.7
12   12     setosa          4.8         3.4
13   13     setosa          4.8         3.0
14   14     setosa          4.3         3.0
15   15     setosa          5.8         4.0
16   16     setosa          5.7         4.4
17   17     setosa          5.4         3.9
18   18     setosa          5.1         3.5
19   19     setosa          5.7         3.8
20   20     setosa          5.1         3.8
21   21     setosa          5.4         3.4
22   22     setosa          5.1         3.7
23   23     setosa          4.6         3.6
24   24     setosa          5.1         3.3
25   25     setosa          4.8         3.4
26   26     setosa          5.0         3.0
27   27     setosa          5.0         3.4
28   28     setosa          5.2         3.5
29   29     setosa          5.2         3.4
30   30     setosa          4.7         3.2
31   31     setosa          4.8         3.1
32   32     setosa          5.4         3.4
33   33     setosa          5.2         4.1
34   34     setosa          5.5         4.2
35   35     setosa          4.9         3.1
36   36     setosa          5.0         3.2
37   37     setosa          5.5         3.5
38   38     setosa          4.9         3.6
39   39     setosa          4.4         3.0
40   40     setosa          5.1         3.4
41   41     setosa          5.0         3.5
42   42     setosa          4.5         2.3
43   43     setosa          4.4         3.2
44   44     setosa          5.0         3.5
45   45     setosa          5.1         3.8
46   46     setosa          4.8         3.0
47   47     setosa          5.1         3.8
48   48     setosa          4.6         3.2
49   49     setosa          5.3         3.7
50   50     setosa          5.0         3.3
51   51 versicolor          7.0         3.2
52   52 versicolor          6.4         3.2
53   53 versicolor          6.9         3.1
54   54 versicolor          5.5         2.3
55   55 versicolor          6.5         2.8
56   56 versicolor          5.7         2.8
57   57 versicolor          6.3         3.3
58   58 versicolor          4.9         2.4
59   59 versicolor          6.6         2.9
60   60 versicolor          5.2         2.7
61   61 versicolor          5.0         2.0
62   62 versicolor          5.9         3.0
63   63 versicolor          6.0         2.2
64   64 versicolor          6.1         2.9
65   65 versicolor          5.6         2.9
66   66 versicolor          6.7         3.1
67   67 versicolor          5.6         3.0
68   68 versicolor          5.8         2.7
69   69 versicolor          6.2         2.2
70   70 versicolor          5.6         2.5
71   71 versicolor          5.9         3.2
72   72 versicolor          6.1         2.8
73   73 versicolor          6.3         2.5
74   74 versicolor          6.1         2.8
75   75 versicolor          6.4         2.9
76   76 versicolor          6.6         3.0
77   77 versicolor          6.8         2.8
78   78 versicolor          6.7         3.0
79   79 versicolor          6.0         2.9
80   80 versicolor          5.7         2.6
81   81 versicolor          5.5         2.4
82   82 versicolor          5.5         2.4
83   83 versicolor          5.8         2.7
84   84 versicolor          6.0         2.7
85   85 versicolor          5.4         3.0
86   86 versicolor          6.0         3.4
87   87 versicolor          6.7         3.1
88   88 versicolor          6.3         2.3
89   89 versicolor          5.6         3.0
90   90 versicolor          5.5         2.5
91   91 versicolor          5.5         2.6
92   92 versicolor          6.1         3.0
93   93 versicolor          5.8         2.6
94   94 versicolor          5.0         2.3
95   95 versicolor          5.6         2.7
96   96 versicolor          5.7         3.0
97   97 versicolor          5.7         2.9
98   98 versicolor          6.2         2.9
99   99 versicolor          5.1         2.5
100 100 versicolor          5.7         2.8
101 101  virginica          6.3         3.3
102 102  virginica          5.8         2.7
103 103  virginica          7.1         3.0
104 104  virginica          6.3         2.9
105 105  virginica          6.5         3.0
106 106  virginica          7.6         3.0
107 107  virginica          4.9         2.5
108 108  virginica          7.3         2.9
109 109  virginica          6.7         2.5
110 110  virginica          7.2         3.6
111 111  virginica          6.5         3.2
112 112  virginica          6.4         2.7
113 113  virginica          6.8         3.0
114 114  virginica          5.7         2.5
115 115  virginica          5.8         2.8
116 116  virginica          6.4         3.2
117 117  virginica          6.5         3.0
118 118  virginica          7.7         3.8
119 119  virginica          7.7         2.6
120 120  virginica          6.0         2.2
121 121  virginica          6.9         3.2
122 122  virginica          5.6         2.8
123 123  virginica          7.7         2.8
124 124  virginica          6.3         2.7
125 125  virginica          6.7         3.3
126 126  virginica          7.2         3.2
127 127  virginica          6.2         2.8
128 128  virginica          6.1         3.0
129 129  virginica          6.4         2.8
130 130  virginica          7.2         3.0
131 131  virginica          7.4         2.8
132 132  virginica          7.9         3.8
133 133  virginica          6.4         2.8
134 134  virginica          6.3         2.8
135 135  virginica          6.1         2.6
136 136  virginica          7.7         3.0
137 137  virginica          6.3         3.4
138 138  virginica          6.4         3.1
139 139  virginica          6.0         3.0
140 140  virginica          6.9         3.1
141 141  virginica          6.7         3.1
142 142  virginica          6.9         3.1
143 143  virginica          5.8         2.7
144 144  virginica          6.8         3.2
145 145  virginica          6.7         3.3
146 146  virginica          6.7         3.0
147 147  virginica          6.3         2.5
148 148  virginica          6.5         3.0
149 149  virginica          6.2         3.4
150 150  virginica          5.9         3.0
```

lubridate
========================================================

- Dates have many different formats
- 2015-03-10 = 3/10/15 = March 10th, 2015
- When working with data, you want to ensure that all of your dates are in the same format
- The lubridate package can help with this


lubridate
========================================================

In order to set the date into a common format (Called "POSIXt"), you merely need to specify the order:


```r
library(lubridate)
ymd("2015-03-10")
```

```
[1] "2015-03-10 UTC"
```

```r
mdy("3/10/15")
```

```
[1] "2015-03-10 UTC"
```

```r
mdy("March 10th, 2015")
```

```
[1] "2015-03-10 UTC"
```

lubridate
========================================================

Every conceivable order of "ymd" is available:


```r
dmy("The 10th of March in 2015")
```

```
[1] "2015-03-10 UTC"
```

```r
ydm("2015+10+3")
```

```
[1] "2015-03-10 UTC"
```

```r
myd("Mar~15~10")
```

```
[1] "2015-03-10 UTC"
```

lubridate
========================================================

now() outputs the current time. You can extract many date-related features from a POSIXt object:


```r
now()
```

```
[1] "2015-03-10 17:18:46 EDT"
```

```r
week(now()) ## week of year
```

```
[1] 10
```

```r
yday(now()) ## day of year
```

```
[1] 69
```
