## Teen Titans Project Review

Site publication: <http://teentitans.newtfire.org/>
GitHub: <https://github.com/lmcneil7/teen-titans>
Developers: Lauren McNeill (@lmcneil7), Shannon Dunn (@smdunn921), and Amber Peddicord (@amberpeddicord)
Date of Evaluation: 2020-05-05
Evaluated by: @ebeshero


### General 
Teen Titans made great progress this spring. Despite the turmoils of the disrupted semester, this team held together, completed a new season of markup, and worked on seriously exploring its project data about characters’ speaking roles and movements. 

### Research questions
Help! It was a little confusing to trace how the research questions changed this semester, because the language on the “About” page really needs some trimming and editing and refocusing. Rather than dividing up first and second semesters, it would help to step back and consolidate what *all* the research goals of the project are. Which of these have been fulfilled, and which have not? For example, one key question expressed in the first paragraph on the “About” page is, “For example, we know that the main characters are going to be in both, but have you ever wondered if any recurring characters from the television series show up in the comics or vice versa? What about whether or not Slade goes after Robin so frequently in the comics as he does the tv series? By the end of this project, we hope to be able to tell you anything you'd want to know and more!” Does the project currently offer answers to these questions, and if so where? Is it in the discussion of each character, or in the analysis of who speaks the most? 

What the project really needs to do at this point is step back and *rewrite* that “About” page, cleaning out old stuff and prioritizing what matters to the project now in 2020 and beyond. I’m afraid this will require a major overhaul: adding things in to the old framework is only making things difficult to follow. From what I pick up in the Spring 2020 additions to this page and across the site, I believe the data investigated is entirely drawn from the TV series scripts, and that this is not correlated with the metadata from the comics. That is a question I have: What parts of the research this spring involved correlating data from comics metadata with the TV series? That should be immediately clear to the reader of your “About” page. Indeed, the opening paragraph should simply tell us what the most important research is *right now*. Elaborate and clarify in following paragraphs, and by pointing to specific parts of the site. You can do this! 

I think from what I now see, that your site is now more complete in covering two seasons of material, and it does supply more comics metadata. Also it provides studies of characters, but not supported by analysis of the markup. And it provides detail on which characters speak the most, but how is that measured? By counts of how many times they are given speaking roles, or by character length? Finally, it also shows us which characters talk about which other characters in the networks. What do you find is the most illuminating aspect of this research? That is, what are the most important things you have learned about the Teen Titans series (TV and/or comic books) from your work over this year on the project? You want to prioritize that on the “About” page.

### Technologies
The project team definitely learned a lot this semester and gained experience with querying data from and XML database and visualizing it.

#### SVG graphs and Network Analysis 
Shannon’s SVG bar graphs were refined to survey the entire season, as well as individual episodes, and embedding graphs for each episode on that episode’s page makes this material easy to survey by paging through the site. 
          
Amber worked on network analysis and because the data she investigated is so related to the bar graphs, it may be helpful to assemble these networks together on the page with the Season One and Season Two bar graphs, since all of these are providing information about seasons. You might label these on the menu / pages as Season Infographics. 

#### QGIS
We know you learned a lot about QGIS and this team helped us to battle-test @frabbitry's new tutorials! However, the implementation of the QGIS visualization is not very helpful on the site right now. I realize this is because the map itself may not be complete as we see it. Here are some issues and suggestions to resolve them: 
* Site visitors may not know at first what the locations are that we see, rather small, on the map. It may be helpful to see first, or alongside the map of San Francisco Bay the list of locations with its explanation, and some explanation of when it appears and in conjunction with which characters.
* Is the map supposed to be showing us character data *and* location names? That is not really easy to see, but I think I am mostly seeing location names. If the intention is to follow the movement of one or more characters to specific locations, it is not easy to see that right now.
* Several locations seem to be superimposed on the water in one spot in San Francisco Bay. I am pretty sure that is the result of erroneous geolocation. Is it? What is going on? 
* It is not clear *on* the map as time passes which episodes or moments of time are associated with a particular setting. 

I think these can all be resolved by taking some quality time with QGIS *and* the markup to see where the issues are. If you wish to follow characters in time on the  map, I *do* wonder if a static visualization with a path clearly drawn with numbered stopping points would be easier to read. You can still apply those timestamps, but as labels! We do need to be able to see *who* is moving *where* at what specific *moment*, and all of that can be visualized with labels. Time can even be color-coded with markers. 

###  “UX”: User Experience and Site Interface
Some of the site menu options could be reconsidered to make site navigation a little easier. The page called “Analysis” does not seem to really be about analysis so much as character profiles. Changing the title to something like “Characters” or “Character Profiles” might make more sense and ease the site navigation. More significantly the naming of this page seems to align it with a discussion of the “Graphs” which represent a *different* kind of analysis. I would suggest renaming the Graph section to “Analysis” instead. What is important there is not just that this where you go to look at graphs, but rather that you are going to learn something new about Teen Titans from *reading* the graphs and your discussion of them. 

Speaking of the positioning of graphs in the site, it is good to see them being more distributed with the text transcripts! However, while adding SVG plots to each episode’s page is a welcome development, one interactive dimension gets buried, and that is the capacity to highlight the speaking characters in the transcript. So here is a challenge: Try moving the toggle box to the top and use it to highlight the character in the SVG graph *and* in the transcript! That would involve some careful work with your attributes on the SVG `<g>` elements for the bars to give them the same name and value as those referring to the speeches by character in the transcript. 

### GitHub
The GitHub repo, as ever, is carefully organized and shows that you held together as a team as the world was falling apart around us in March and April! We are happy to see that you have even backed up *some* of your XQuery scripts stored in the Newtfire eXist-dB. One thing I *strongly* recommend is that all the XQuery (not just Amber’s, but Shannon’s and Lauren’s too) be copied and saved on this GitHub repo, especially since NewtFire may undergo some upgrades and you should keep your own copies of your query files. Save those with a .xql or .xquery file extension and download them (or copy and paste them into oXygen, save with `.xql` or `.xquery` for storage). The eXist-dB XML database will likely be reinstalled at some point this summer, and you should keep the files that you wrote to query your project. Some day you may want to migrate those to another server, and they are really the most important piece of your project work!

### Closing Comments
I have enjoyed working with *each* member of this team this semester as you took on serious challenges and helped improve our course materials too. We were all learning together and the pandemic could not stop that. Thank you, each of you, for your dedication to our digital community! I can see from this project that it is not really finished and I want to see you continue with it as you can. So these comments are meant to encourage you to come back and tidy up the project to make it as complete as you can for yourselves and for the Teen Titans community and for students of the future who will come and see your project and learn from you! 

You can always return to Newtfire to update the site as you wish, so please keep in touch about that on GitHub. Just make sure you hang onto your SSH keys, but even if you lose them in moving to a  new computer, not to worry. Just get in touch with me and we can reset things: you can always work with a new SSH key pair. I (@ebeshero) am moving to teach at Penn State Erie this summer, but you can always find me here on GitHub and NewtFire with all the student projects will persist independent of university affiliation. I will miss each of you, but this is not goodbye, Teen Titans team! I hope that you will stick together and see this thing through, and keep in touch whatever the future holds!  

