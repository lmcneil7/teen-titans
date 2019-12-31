## Teen Titans Team Project Review

Site publication: <http://teentitans.newtfire.org>
GitHub: <https://github.com/lmcneil7/teen-titans>
Developers:
* Lauren McNeill: @lmcneil7
* Shannon Dunn: @smdunn921


Date of Evaluation: 2019-12-16
Evaluated by: @ebeshero @alnopa9


### General
Teen Titans team realized an ambitious vision to coordinate a set of *Teen Titans* TV scripts from Season 1 with data about the *Teen Titans* comic book series. This project launch gives the worldwide web a significant new information resource for fans and pop culture afficionados of which the team can be justly proud. There is also plenty of material here for the team to continue developing from the strong foundation they have created. 

### Research questions
As stated on the Methodology page, the project’s “ultimate goal is to use markup to find differences between the Teen Titans tv series and comic book.” This was ambitious because scripts are not as easily available in digital form for the comic, so the team compiled metadata about the comics. A particular challenge was to represent how a particular TV episode might draw from multiple comics.

The team also investigated which characters had the most speaking roles in the TV series through its markup of the TV scripts. The markup of stage directions and character descriptions also suggests areas of research that could be developed and fully analyzed with more time if the project team members decide they wish to continue the project. 


### Technologies

You took care in encoding the base XML and Relax NG schemas for [the TV series](https://github.com/lmcneil7/teen-titans/blob/master/xml/schema.rnc) and for [the comics](https://github.com/lmcneil7/teen-titans/blob/master/xml/comic/comic_schema.rnc), and this approach with two distinct schemas gave you a little more complexity to work with than most projects we see. Your schemas are especially important because a) they represent your careful systematic thinking about your project especially in your updating them over the course of the semester, and b) they set the stage for all the research and archive work you did and more, because your schema represents a lot of markup you haven't yet "pulled" for analysis (though you always could). The strength of an XML project is in its schema planning, and yours is especially sound. 

The HTML and CSS are well designed—and [valid with the w3C](https://validator.w3.org/nu/?doc=http%3A%2F%2Fteentitans.newtfire.org%2F), which is difficult to accomplish, so congratulations! The site is cleverly designed with clickable images to guide us out to more information about the comics. And you developed a good foundation for your page design working with CSS flexboxes. 

You applied XSLT and SVG to show how the comics relate to the TV scripts, and to help correlate related kinds of information to build a really informative web archive. We think you could continue on with analyzing some patterns in your metadata. For example, which episodes represent the largest number of comic book issues? What's the average ratio of comics to TV episodes, and what's the maximum and minimum? (We know the minimum is zero from paging through the Texts section, but perhaps you could make a chart to quickly sum up this information at a glance, and show which comics get completely cut from representation in the series.) The Character Design section on the analysis page gives us perspective on how characters were altered from comics to TV, and perhaps you could add more data pulled from your comics markup here.
    
### GitHub
You two made a well-balanced team and [your GitHub history](https://github.com/lmcneil7/teen-titans/graphs/contributors) reflects that you both took great care with this project. The [commits log](https://github.com/lmcneil7/teen-titans/commits/master) is impressive at 222 commits at the time of this writing, and may be amusing for you to review. We like that your commit messages indicate something specific you were building or correcting and they make a strong documentary record of your teamwork. Well done! 

###  “UX”: User Experience and Site Interface
The site colors and page layouts are generally well chosen and visually appealing. Light colors on black can be a challenge, and we'd recommend brightening the blue you're using for the highlighting of Cyborg—perhaps to the more aqua color we see on the main page logo. 

#### Navigating the graphs
Overall, the site is well organized and contains lots of distinct kinds of information about the Teen Titans books and TV series. Usually it's easy to find a way back to the home page and its navigation bar, but when we get into the analysis pages, it’s easy to get lost as soon as we start opening each distinct SVG graph on its own page. One way to improve this could be to add links back to the main Analysis page, and back Home on each SVG. SVG has link capacity much like HTML, for more, see <https://developer.mozilla.org/en-US/docs/Web/SVG/Element/a>. But there may be a better way. One service you're providing with this site is for fans of Teen Titans to be able to compare information about episodes. If your SVG graphs were made smaller, perhaps we could set them all together on one page! This involves experimenting with the SVG viewport, and there's a really good three-part tutorial by Sarah Souiedan on exactly this: how to scale and adjust SVG to fit the way you want it browser windows. You may not really need all of this,but we still think you’ll find it useful: 

Sarah Soueidan's tutorial on Understanding SVG Coordinate Systems and Transformations:

* [Part 1: viewport, viewBox, and oreserveAspectRatio](https://www.sarasoueidan.com/blog/svg-coordinate-systems/)
* [Part 2: The transform attribute](https://www.sarasoueidan.com/blog/svg-transformations/)
* [Part 3: Establishing new viewports](https://www.sarasoueidan.com/blog/nesting-svgs/)

Think about how you might balance some text with each of these graphs, but also how they might fit together to make a comparison view--perhaps two or three small graphs could sit side-by-side in flex boxes across your screen, and as we scroll down we can see which characters are the most talkative? Also, perhaps each SVG graph can be linked directly to your page holding the TV episode script--another navigation tool.

You could even include a tiny version of each graph in your archive page with the TV script! You may, even so, still want to include all the graphs together for the reader to see at once so that they can easily compare episodes based on who talks the most. 

#### Navigating the scripts

The Texts portion of your site could use some more attention to navigation as well. Once we're inside, of course, we can navigate in order through all the episodes, but it's not easy (= you really can't) jump around. What about preparing a small special navbar for across the top or bottom of the screen just for the Texts portion that lists and links all 13 episodes from Season 1, so that option is always available on each page? That raises a question for the long term: Would you want to come back and add more pages for all five seasons? Well, if so, you could create a new "deck" of pages for each season and give each its own distinct navigation bar. (We hope you'll consider doing this!) 

The javascript toggle for each Titan's speech works well and adds some fun color to the site, though as we suggested earlier you may wish to brighten up some of the colors to make the names associated with them easier to read against the black background. We think you could coordinate the colors you chose for each Titan with your graphs, to integrate those pieces of your site a little more effectively. (And as we mentioned above, with a little tinkering we think you can set a mini-version of each graph in with each text.) 
    
#### Appealing more directly to the *Teen Titans* fan base
The Methodology page is written mostly to an “inside audience” of people who code. And those are an important group of people, because that’s our class and others related to it who will come to your site looking for inspiration. But you’re also communicating with people who care about pop culture, media studies, and *Teen Titans*, who don’t know about coding and never heard of XSLT. So one thing you can do is partition those audiences from one another. It can be a real challenge to write outside your immediate coding context about how you made this project without sounding too technical—and yet still convey the substance of what you did—and that is exactly what we think you should try doing now. Try putting that section on top, and then have a section specifically headed and addressed to coders who know about XML and what we call “the XML stack” where you can dive into the details of that nifty code that lets us output a new HTML page for every turn of an `<xsl:for-each>` loop.  

### Closing Comments
Overall, we are impressed with how much the Teen Titans team learned and accomplished in launching this significant digital archive! We have written you lots of comments and suggestions here because your strong codebase gives you lots of options to continue developing this project, as we hope you will! For now, congratulations on bringing a seriously impressive archive and analysis of *Teen Titans* into the digital world! 
