Operations with Vectors
================

Basic Operations with Vectors
-----------------------------

This is the monthly average temperature in Baltimore (from <http://www.rssweather.com/climate/Maryland/Baltimore/>)

``` r
tempHi <- c(41.2,44.8,53.9,64.5,73.9,82.7,87.2,85.1,78.2,67.0,56.3,46.0)
tempHi
```

    ##  [1] 41.2 44.8 53.9 64.5 73.9 82.7 87.2 85.1 78.2 67.0 56.3 46.0

We can label the vectors' elements!

``` r
months <- c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")
names(tempHi) <- months
tempHi
```

    ##  Jan  Feb  Mar  Apr  May  Jun  Jul  Aug  Sep  Oct  Nov  Dec 
    ## 41.2 44.8 53.9 64.5 73.9 82.7 87.2 85.1 78.2 67.0 56.3 46.0

Let's also get the lowers:

``` r
tempLo <- c(23.5,26.1,33.6,42.0,51.8,60.8,65.8,63.9,56.6,43.7,34.7,27.3)
```

Now we can do simple operations on the whole vectors.

``` r
range <- tempHi-tempLo
range
```

    ##  Jan  Feb  Mar  Apr  May  Jun  Jul  Aug  Sep  Oct  Nov  Dec 
    ## 17.7 18.7 20.3 22.5 22.1 21.9 21.4 21.2 21.6 23.3 21.6 18.7

Covnert it to Celsius:

``` r
tempHiC <- (5/9) * (tempHi - 32)
tempHiC
```

    ##       Jan       Feb       Mar       Apr       May       Jun       Jul 
    ##  5.111111  7.111111 12.166667 18.055556 23.277778 28.166667 30.666667 
    ##       Aug       Sep       Oct       Nov       Dec 
    ## 29.500000 25.666667 19.444444 13.500000  7.777778

Is this month too cold?

``` r
tooCold <- (((5/9) * (tempLo - 32)) < 0)
tooCold
```

    ##  [1]  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ## [12]  TRUE

### Accessing Elements in a Vector

By indexes:

``` r
tempHi[7] # July
```

    ##  Jul 
    ## 87.2

``` r
tempHi[12] # December
```

    ## Dec 
    ##  46

By ranges:

``` r
tempHi[7:9] # July-September
```

    ##  Jul  Aug  Sep 
    ## 87.2 85.1 78.2

By lists:

``` r
tempHi[c(11:12,1:2)] # Nov-Feb
```

    ##  Nov  Dec  Jan  Feb 
    ## 56.3 46.0 41.2 44.8

By sequences:

``` r
tempHi[seq(2,12,2)] # Even months
```

    ##  Feb  Apr  Jun  Aug  Oct  Dec 
    ## 44.8 64.5 82.7 85.1 67.0 46.0
