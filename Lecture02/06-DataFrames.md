Data Frames
================

-   [Data Frames are Tables](#data-frames-are-tables)
    -   [Information on Data Frames](#information-on-data-frames)
    -   [Accessing Data Frames Elements](#accessing-data-frames-elements)
    -   [Adding More Data, Removing Data](#adding-more-data-removing-data)
-   [Reading Data Frames](#reading-data-frames)
    -   [From CSV](#from-csv)
-   [Writing and Reading R Data](#writing-and-reading-r-data)

Data Frames are Tables
----------------------

Data Frames are the most common way to represent data in R in Data Science and Data Mining applications.

We can create data frames from sets of observations. This below is a column-based example.

``` r
maxTempSJC <- c(29.7,30.1,29.5,27.3,25.1,24.3,24.1,26.2,27.2,27.3,28,28.7)
avgTempSJC <- c(22.2,22.4,21.6,19.6,17,16.1,15.6,17.1,18.8,19.4,20.3,21.4)
minTempSJC <- c(16.2,16.5,15.7,13.2,10.1,8.9,8.2,9.9,11.9,13.4,14.2,15.3)
months <- c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")
sjcTemps <- data.frame(Max=maxTempSJC,Avg=avgTempSJC,Min=minTempSJC,row.names = months)
sjcTemps
```

    ##      Max  Avg  Min
    ## Jan 29.7 22.2 16.2
    ## Feb 30.1 22.4 16.5
    ## Mar 29.5 21.6 15.7
    ## Apr 27.3 19.6 13.2
    ## May 25.1 17.0 10.1
    ## Jun 24.3 16.1  8.9
    ## Jul 24.1 15.6  8.2
    ## Aug 26.2 17.1  9.9
    ## Sep 27.2 18.8 11.9
    ## Oct 27.3 19.4 13.4
    ## Nov 28.0 20.3 14.2
    ## Dec 28.7 21.4 15.3

``` r
class(sjcTemps)
```

    ## [1] "data.frame"

Now for a row-based example, starting with an empty Data Frame:

``` r
sjcTemps2 <- data.frame(Max=numeric(),Avg=numeric(),Min=numeric())
sjcTemps2 <- rbind(sjcTemps2,data.frame(Max=29.7,Avg=22.2,Min=16.2))
sjcTemps2 <- rbind(sjcTemps2,data.frame(Max=30.1,Avg=22.4,Min=16.5))
sjcTemps2 <- rbind(sjcTemps2,data.frame(Max=29.5,Avg=21.6,Min=15.7))
sjcTemps2 <- rbind(sjcTemps2,data.frame(Max=27.3,Avg=19.6,Min=13.2))
sjcTemps2 <- rbind(sjcTemps2,data.frame(Max=25.1,Avg=17,  Min=10.1))
sjcTemps2 <- rbind(sjcTemps2,data.frame(Max=24.3,Avg=16.1,Min= 8.9))
sjcTemps2 <- rbind(sjcTemps2,data.frame(Max=24.1,Avg=15.6,Min= 8.2))
sjcTemps2 <- rbind(sjcTemps2,data.frame(Max=26.2,Avg=17.1,Min= 9.9))
sjcTemps2 <- rbind(sjcTemps2,data.frame(Max=27.2,Avg=18.8,Min=11.9))
sjcTemps2 <- rbind(sjcTemps2,data.frame(Max=27.3,Avg=19.4,Min=13.4))
sjcTemps2 <- rbind(sjcTemps2,data.frame(Max=28,  Avg=20.3,Min=14.2))
sjcTemps2 <- rbind(sjcTemps2,data.frame(Max=28.7,Avg=21.4,Min=15.3))
row.names(sjcTemps2) <- months
sjcTemps2
```

    ##      Max  Avg  Min
    ## Jan 29.7 22.2 16.2
    ## Feb 30.1 22.4 16.5
    ## Mar 29.5 21.6 15.7
    ## Apr 27.3 19.6 13.2
    ## May 25.1 17.0 10.1
    ## Jun 24.3 16.1  8.9
    ## Jul 24.1 15.6  8.2
    ## Aug 26.2 17.1  9.9
    ## Sep 27.2 18.8 11.9
    ## Oct 27.3 19.4 13.4
    ## Nov 28.0 20.3 14.2
    ## Dec 28.7 21.4 15.3

``` r
class(sjcTemps2)
```

    ## [1] "data.frame"

### Information on Data Frames

Basic functions to get information on data frames:

``` r
nrow(sjcTemps)
```

    ## [1] 12

``` r
ncol(sjcTemps)
```

    ## [1] 3

``` r
head(sjcTemps)
```

    ##      Max  Avg  Min
    ## Jan 29.7 22.2 16.2
    ## Feb 30.1 22.4 16.5
    ## Mar 29.5 21.6 15.7
    ## Apr 27.3 19.6 13.2
    ## May 25.1 17.0 10.1
    ## Jun 24.3 16.1  8.9

More information with <tt>str</tt>:

``` r
str(sjcTemps)
```

    ## 'data.frame':    12 obs. of  3 variables:
    ##  $ Max: num  29.7 30.1 29.5 27.3 25.1 24.3 24.1 26.2 27.2 27.3 ...
    ##  $ Avg: num  22.2 22.4 21.6 19.6 17 16.1 15.6 17.1 18.8 19.4 ...
    ##  $ Min: num  16.2 16.5 15.7 13.2 10.1 8.9 8.2 9.9 11.9 13.4 ...

Even more information (statistics) with <tt>summary</tt>:

``` r
summary(sjcTemps)
```

    ##       Max             Avg             Min       
    ##  Min.   :24.10   Min.   :15.60   Min.   : 8.20  
    ##  1st Qu.:25.93   1st Qu.:17.07   1st Qu.:10.05  
    ##  Median :27.30   Median :19.50   Median :13.30  
    ##  Mean   :27.29   Mean   :19.29   Mean   :12.79  
    ##  3rd Qu.:28.90   3rd Qu.:21.45   3rd Qu.:15.40  
    ##  Max.   :30.10   Max.   :22.40   Max.   :16.50

### Accessing Data Frames Elements

Accessing by columns' names

``` r
sjcTemps$Min
```

    ##  [1] 16.2 16.5 15.7 13.2 10.1  8.9  8.2  9.9 11.9 13.4 14.2 15.3

``` r
sjcTemps$Max
```

    ##  [1] 29.7 30.1 29.5 27.3 25.1 24.3 24.1 26.2 27.2 27.3 28.0 28.7

Accessing individual values

``` r
sjcTemps$Min[2]
```

    ## [1] 16.5

``` r
sjcTemps$Max[2]
```

    ## [1] 30.1

Basic slicing:

``` r
sjcTemps[,2]
```

    ##  [1] 22.2 22.4 21.6 19.6 17.0 16.1 15.6 17.1 18.8 19.4 20.3 21.4

``` r
sjcTemps[2,]
```

    ##      Max  Avg  Min
    ## Feb 30.1 22.4 16.5

``` r
sjcTemps[2,2]
```

    ## [1] 22.4

Using names:

``` r
sjcTemps["Jul",]
```

    ##      Max  Avg Min
    ## Jul 24.1 15.6 8.2

``` r
sjcTemps["Jul",1]
```

    ## [1] 24.1

``` r
sjcTemps["Jul","Min"]
```

    ## [1] 8.2

Using ranges, etc.:

``` r
sjcTemps[1:6,c(1,3)]
```

    ##      Max  Min
    ## Jan 29.7 16.2
    ## Feb 30.1 16.5
    ## Mar 29.5 15.7
    ## Apr 27.3 13.2
    ## May 25.1 10.1
    ## Jun 24.3  8.9

``` r
sjcTemps["Jul",2:3]
```

    ##      Avg Min
    ## Jul 15.6 8.2

``` r
sjcTemps[c("Jan","Jul"),c("Max","Min")]
```

    ##      Max  Min
    ## Jan 29.7 16.2
    ## Jul 24.1  8.2

If we can read these values, we can change them.

``` r
sjcTemps3 <- sjcTemps
sjcTemps3["Jul",] <- 0
sjcTemps3[,"Avg"] <- 0
sjcTemps3["Aug",] <- c(1,2,3)
sjcTemps3["Jul",] <- sjcTemps3["Jul",]+c(3,4)
sjcTemps3["Dec","Max"] <- 50
sjcTemps3
```

    ##      Max Avg  Min
    ## Jan 29.7   0 16.2
    ## Feb 30.1   0 16.5
    ## Mar 29.5   0 15.7
    ## Apr 27.3   0 13.2
    ## May 25.1   0 10.1
    ## Jun 24.3   0  8.9
    ## Jul  3.0   4  3.0
    ## Aug  1.0   2  3.0
    ## Sep 27.2   0 11.9
    ## Oct 27.3   0 13.4
    ## Nov 28.0   0 14.2
    ## Dec 50.0   0 15.3

### Adding More Data, Removing Data

We can add new columns to a Data Frame: just choose a new column name and an operation to fill it.

``` r
sjcTemps$Range <- sjcTemps$Max-sjcTemps$Min
sjcTemps$Flag <- TRUE
sjcTemps$Vacations <- c(TRUE,TRUE,FALSE,FALSE,FALSE,FALSE,TRUE,FALSE,FALSE,FALSE,FALSE,TRUE)
sjcTemps$Season <- factor(c('Summer','Summer','Autumn','Autumn','Autumn','Winter',
                     'Winter','Winter','Spring','Spring','Spring','Summer'))
sjcTemps
```

    ##      Max  Avg  Min Range Flag Vacations Season
    ## Jan 29.7 22.2 16.2  13.5 TRUE      TRUE Summer
    ## Feb 30.1 22.4 16.5  13.6 TRUE      TRUE Summer
    ## Mar 29.5 21.6 15.7  13.8 TRUE     FALSE Autumn
    ## Apr 27.3 19.6 13.2  14.1 TRUE     FALSE Autumn
    ## May 25.1 17.0 10.1  15.0 TRUE     FALSE Autumn
    ## Jun 24.3 16.1  8.9  15.4 TRUE     FALSE Winter
    ## Jul 24.1 15.6  8.2  15.9 TRUE      TRUE Winter
    ## Aug 26.2 17.1  9.9  16.3 TRUE     FALSE Winter
    ## Sep 27.2 18.8 11.9  15.3 TRUE     FALSE Spring
    ## Oct 27.3 19.4 13.4  13.9 TRUE     FALSE Spring
    ## Nov 28.0 20.3 14.2  13.8 TRUE     FALSE Spring
    ## Dec 28.7 21.4 15.3  13.4 TRUE      TRUE Summer

``` r
str(sjcTemps)
```

    ## 'data.frame':    12 obs. of  7 variables:
    ##  $ Max      : num  29.7 30.1 29.5 27.3 25.1 24.3 24.1 26.2 27.2 27.3 ...
    ##  $ Avg      : num  22.2 22.4 21.6 19.6 17 16.1 15.6 17.1 18.8 19.4 ...
    ##  $ Min      : num  16.2 16.5 15.7 13.2 10.1 8.9 8.2 9.9 11.9 13.4 ...
    ##  $ Range    : num  13.5 13.6 13.8 14.1 15 15.4 15.9 16.3 15.3 13.9 ...
    ##  $ Flag     : logi  TRUE TRUE TRUE TRUE TRUE TRUE ...
    ##  $ Vacations: logi  TRUE TRUE FALSE FALSE FALSE FALSE ...
    ##  $ Season   : Factor w/ 4 levels "Autumn","Spring",..: 3 3 1 1 1 4 4 4 2 2 ...

We can also drop columns from a Data Frame:

``` r
sjcTempsModified <- sjcTemps # avoid changing this one...
sjcTempsModified$Avg <- NULL
sjcTempsModified$Flag <- NULL
head(sjcTempsModified)
```

    ##      Max  Min Range Vacations Season
    ## Jan 29.7 16.2  13.5      TRUE Summer
    ## Feb 30.1 16.5  13.6      TRUE Summer
    ## Mar 29.5 15.7  13.8     FALSE Autumn
    ## Apr 27.3 13.2  14.1     FALSE Autumn
    ## May 25.1 10.1  15.0     FALSE Autumn
    ## Jun 24.3  8.9  15.4     FALSE Winter

Other way do to this:

``` r
sjcTempsModified <- subset(sjcTemps, select = c(Min,Max,Season))
# Also: sjcTempsModified <- sjcTemps[keep]
head(sjcTempsModified)
```

    ##      Min  Max Season
    ## Jan 16.2 29.7 Summer
    ## Feb 16.5 30.1 Summer
    ## Mar 15.7 29.5 Autumn
    ## Apr 13.2 27.3 Autumn
    ## May 10.1 25.1 Autumn
    ## Jun  8.9 24.3 Winter

Another one:

``` r
sjcTempsModified <- subset(sjcTemps, select = -c(Range,Flag,Avg,Season))
head(sjcTempsModified)
```

    ##      Max  Min Vacations
    ## Jan 29.7 16.2      TRUE
    ## Feb 30.1 16.5      TRUE
    ## Mar 29.5 15.7     FALSE
    ## Apr 27.3 13.2     FALSE
    ## May 25.1 10.1     FALSE
    ## Jun 24.3  8.9     FALSE

Reading Data Frames
-------------------

Creating Data Frames in code is not practical. Let's read them from files.

### From CSV

Writing and Reading R Data
--------------------------

dump source
