---
layout: post
title: "Sorting instagram posts by likes"
date: 2023-04-22 14:48 +0530
categories: development
author: themythicalengineer
tags: development
comments: true
blogUid: dee396f8-6b2c-4b99-9f45-8e4a73b8e37a
---
# Sorting instagram posts by likes 
Hi! 
This post is about a semi-automatic method to sort posts of an  **Instagram** user by likes. Why you use this method is totally your concern,  I take no responsibilities. I am in no way related to Instagram themselves. 
Having said that I hope it is of value to some value of you. 

### Requirement

 - A web browser(any modern web browser with developer tools should be fine).
I will be using google chrome for this blog post but you should be able to find all features I use here  (console, saving, filtering etc) in all modern browsers.
 - Python ( I am using python3 but if you use python 2, adjust script accordingly)
 - An instagram account(duh!)
 - Some time (depending on number of instagram posts and your internet speed)

### Steps

 1. Login to instagram on your favourite browser and navigate to the page/account for which you want to sort the posts by likes. (https://www.instagram.com/furr_facts/) in this case.![enter image description here](https://www.popsci.com/uploads/2022/01/31/Instagram-on-web-browser.jpg)
Please note if it is a private account that you do not follow them, you won't be able to see their posts and also not able to sort them in any way. 
 2. Open your browser's console ([Reference here](https://balsamiq.com/support/faqs/browserconsole/)). 
 3. Navigate to network tab and clear the existing logs(little bin icon or block icon that says 'Clear') . In case of chrome also click on 'Preserve log'.
 4. Filter  requests by *XHR* and in the filter bar type `api/`
 5. Switch back to console tab and run below script.


        iter = 100;
        interval = 1500;
    	var i = 1;                  
    	function myLoop() {         
    	  setTimeout(function() {   
    	i++;
        window.scrollByPages(1);  
        if (i > 100) return;      
          myLoop();             
        }, interval)
        }
        myLoop();    

 Modify the *interval* based on your internet speed(lower for faster internet)
 Modify the *iter* based on number of posts in that account(higher for higher posts).
6. The pages will start scrolling by itself, you have to sit through it and wait for scrolling to reach the end(if you want to sort through all posts). Keep the browser window open. If the scrolling doesn't reach end, keep re-running the console script from step 5 until it does.
7. After the page has reached the end(can't scroll any further), right click on one of the requests and choose save all as har option. Save this file to somewhere your computer.
8. 

