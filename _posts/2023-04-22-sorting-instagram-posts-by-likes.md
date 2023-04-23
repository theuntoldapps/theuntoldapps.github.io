---
layout: post
title: "Sorting instagram posts by likes"
date: 2023-04-22 14:48 +0530
categories: script instagram tech-hacks
author: theuntoldapps
tags: script instagram tech-hacks
comments: true
blogUid: dee396f8-6b2c-4b99-9f45-8e4a73b8e37a
---

Hi!

This post is about a semi-automatic method to sort posts of an **Instagram** user by likes. Why you use this method is totally your concern, I take no responsibilities. I am in no way related to Instagram themselves.
Another thing is web APIs for a service like Instagram keep changing with time. The scripts used or the method may not work after some time but as of writing this article it is working.

Having said that I hope it is of value to some value of you.

## Requirement

- A web browser(any modern web browser with developer tools should be fine).

I will be using Mozilla Firefox for this blog post(which is also my recommendation). But you should be able to find all features I use here (console, saving, filtering etc) in all modern browsers.

- Python ( I am using python3 but if you use python 2, adjust script accordingly)

- An instagram account(duh!)

- Some time (depending on number of instagram posts and your internet speed)

- This [script](https://gist.github.com/theuntoldapps/9c355e892a9f606e7c385b823da8a826)


## Steps

- Login to instagram on your favourite browser and navigate to the page/account for which you want to sort the posts by likes. 
[Google's Instagram page](https://www.instagram.com/google/) in this case.

![Instagram web page](/assets/images/sorting-instagram-posts-by-likes/instapage.png)

Please note if it is a private account that you do not follow, you won't be able to see their posts and also not able to sort them in any way.

- Open your browser's console ([Reference here](https://balsamiq.com/support/faqs/browserconsole/)).

- Navigate to network tab and clear the existing logs(little bin icon 'Clear') .

![Clear logs option](/assets/images/sorting-instagram-posts-by-likes/clear.png)

- Filter requests by *XHR* and in the filter bar type `api/`

![Filter by xhr](/assets/images/sorting-instagram-posts-by-likes/xhr.png)

- Switch back to console tab and run below script.

	    iter = 183;
	    
	    interval = 1500;
	    
	    var i = 1;
	    
	    function myLoop() {
	    
	    setTimeout(function() {
	    
	    i++;
	    
	    window.scrollByPages(1);
	    
	    if (i > iter) return;
	    
	    myLoop();
	    
	    }, interval)
	    
	    }
	    
	    myLoop();

  

Modify the *interval* based on your internet speed(lower for faster internet)

Modify the *iter* based on number of posts in that account(higher for higher posts). On average a successful request fetches about 12 items, so a good starting number for iter is approximately(number_of_posts/12)

- The pages will start scrolling by itself, you have to sit through it and wait for scrolling to reach the end(if you want to sort through all posts). Keep the browser window open. If the scrolling doesn't reach end, keep re-running the console script from step 5 until it does.

![Console script running](/assets/images/sorting-instagram-posts-by-likes/console.png)

- After the page has reached the end(can't scroll any further), go to Network tab and right click on one of the requests and choose `save all as har` option. Save this file to somewhere your computer.

![Saving har file](/assets/images/sorting-instagram-posts-by-likes/savehar.png)

- After downloading this file, you will need to run this python script. 
- Finally run the script from terminal like this. 
	
       python sorter.py downloaded.har 10

  This will get you links to top 10 post links by likes.

![Running the script](/assets/images/sorting-instagram-posts-by-likes/scipt.png)

If you want top 100 posts you can just change the number  :

       python sorter.py downloaded.har 100

