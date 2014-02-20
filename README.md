cbc-podcasts-fix
================

CBC's lack of XML sanitization getting you down? Here's some simultaneously brainlessly simple and needlessly complex scripts to help!


What's the problem?
-------------------

Well, twofold:

1. Whatever mechanism the CBC uses to create their podcast feeds, it doesn't bother sanitizing them, so stuff like stray &'s often sneaks in, breaking things for some podcast clients.
2. Even though every podcast is basically http://cbc.ca/podcasting/includes/*.xml, if you just go to http://cbc.ca/podcasting/includes/ it instead redirects you to an old broken version of the CBC Ideas page. Huh?


What's the solution?
--------------------

Using Python to scrape the podcasting page for links, then using a bash script to run a very similar Python script on each page found this way, and finally taking that list of URLs and filtering it for ones that match our expectations, and thus brute-forcing a list of all the CBC podcasts.

Yeah, it's kindof dumb, but something makes me feel good about clobbering the CBC website a bit every time to create the list, as a kind of statement of "see how stupid things get when you don't just let me do a directory listing? What's so wrong with directories?"


How do I run this?
------------------

Well, you'll need a few dependencies. The following might well be enough, though:
```
sudo apt-get install python-bs4 tidy
```

If you aren't running something Debian-based then, I mean, just install Beautiful Soup and the "tidy" utility. It's not like I'm asking for specific versions of boost or something. God I hate boost.

Then just run `get_listings.sh` if you don't trust (or think you should update) the final.list.

Penultimately, run `publish.sh` (uncommenting and filling in the rsync lines if you want to push it to a webserver from the script).

Finally, marvel at how overly complicated it is. Is Keith really just making a point? Or is it sheer laziness? Maybe both?


I'm lazy, I want to just point my podcast client at something
-------------------------------------------------------------

I have copies I've sanitized at http://keithzg.ca/cbc in case you trust me to remember to update them. I'll write a quick cron job sometime, I swear!


You're lazy, why is this so sloppy and sprawling?
-------------------------------------------------

Didn't we kindof go over this already? But yeah, I mean you're right, imaginary person that probably doesn't exist because perhaps nobody will ever read this, this is more of a quick slapdash proof of concept than anything. But I mean, feel free to contribute pull requests that tidy it up! Maybe use Python's own libtidy implementation rather than the hilarious method I'm using, for example. And maybe pull the listing in a way that isn't awkward overkill.


Is this one of those hippie open source things?
-----------------------------------------------

Yup, and I've decided to license it under copyleft-next 0.3.0. See LICENSE.markdown for the gory legal details.

Speaking of legal details, I'd like to state for the record that if I got a cease-and-desist or such from the CBC that would be _the best thing ever_. Although I don't see why they would send such a thing, so that's really more of a pipe dream. Even better, but sadly perhaps even less likely, would be them _fixing the damned podcast setup_ so that they kept it clean of XML-spec breaking mistakes! And while I'm wistfully dreaming my life away, man, if they hadn't ever cancelled Brave New Waves? Wow. That's would be a perfect fucking world. The CBC is capable of great and unique things, don't doubt it. If only the people who run it (up to and including our Honorable federal government members) wouldn't work so hard against it.