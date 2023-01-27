# Surf's Up Analysis

## Overview of the Surfs Up Analysis:

This week, students were introduced to SQLite, SQLAlchemy, and Flask. These tools allow users to efficiently interact with and deliver data, and are a way to test and learn in a more streamlined way than using PostgresSQL. While there are limitations to how much you can do with SQLite versus PostgresSQL, in certain instances where you may want to quickly evaluate and query data, these tools offer a great alternative and can be a powerful way to help better understand data. In addition, this week’s module incorporates key concepts and skills development including:

- Understanding structures, interactions, and types of data
- Differentiating between SQLite and PostgreSQL databases
- Using SQLAlchemy to connect to and query a SQLite database
- Using statistics like minimum, maximum, and average to analyze data
- Designing a Flask application using data

Also in this week’s module, the Surf’s Up simulation offers a real-world example where W. Avy, a business partner interested in opening up a combination surf shop and ice cream store, asks you to analyze weather data on the Island of Oahu, HI in order to determine feasibility of the project.

## Results: 

- In looking at the variance between June and December temperature data, June has an average temperature of 74.9 degrees,  which is 6% higher than the average temperature in December. 

- That said, December temperatures have more variability with a standard deviation of 3.75 degrees, versus 3.26 degrees for June.

- Interestingly, the max temperatures recorded for June versus December are not that far off from each other, with a max tempof 85 degrees in June and 83 degrees in December. There could be outliers, however, which might skew the results.

![](https://github.com/vjtrom/surfs_up/blob/main/images/Overall%20Temps.png)

## Summary:  

- In summary, temperatures are pretty moderate for Oahu, and the variance between June and December is non significantly different. 

- When looking at the weather station with the most temperature reading observations, Station USC00519281, there are comparable differences between the average June vs December temperatures. Similar to what we see on an overall basis, Station USC00519281 has a higher standard deviation in December temps, meaning there is more variability that time of the year.

- When looking at precipitation, June is drier that December, with average precipitation of 0.14 inches versus 0.22. There is a much greater variability in December precipitation, which means some years may be wetter than others. 

- Overall, it looks like Oahu might be a good place to open up the combination Surf Shop and Ice-cream store, with weather being pretty consistent throughout the year.

![](https://github.com/vjtrom/surfs_up/blob/main/images/Station%20USC00519281%20Temps.png)

![](https://github.com/vjtrom/surfs_up/blob/main/images/Overall%20Precip.png)
