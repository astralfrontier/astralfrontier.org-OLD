---
title: Vessels Mechanics (Part 2)
template: blogpost.jade
collection: blog
---

[In the last post](/blog/2015-07-13-vessels-mechanics-part-1.html),
I talked about the three phases of the "vessels" game:
disrupt, discover, and direct.

<!-- more -->

In [The Crown](/fiction/vessels/crown.html), an unnamed lady knight
faces a crowd filled with fear, and tries to galvanize their feelings
of hope. Instead she faces contempt, tied to her own feelings of shame.
How do we model what happens to her? Let's take a look at the emotional
map.

![Emotional map](/assets/emotion-cube.png)

We're going to measure everything in 'stars', where a 1-star obstacle
is minor and 5-star is as serious as it gets. Having a star rating
on the map can mean two things: that the emotion is strong and entrenched,
or that the emotion is very unlikely to happen.

The initial conditions will include 4 stars on Fear, and 3 stars on Joy.
The crowd is terrified, and very little is going to make them feel
happiness here until they're home and free.

We'll declare that you move across the map to adjacent nodes, and you can
skip over nodes at extra cost when rolling. Each movement is a roll,
whose difficulty derives from the star cost for each node. For example,
the difficulty of Fear-Joy-Anticipation would be very high because of
the obstacle on Joy. Leaving Fear has its own cost.

The knight plots a course from Fear to Rage to Anticipation - she wants
to fire up the crowd with feelings of bravery and righteousness.
Unfortunately her roll is bad.

However, on her character sheet is some mechanism that lets her either
direct failures onto, or at least make more likely, a Contempt outcome.
As part of her backstory, overcoming such feelings are a common action
for her. So as part of the discovery phase, she puts a heckler into the
crowd to arouse such feelings, and as part of the direct phase, she
places the new obstacle to overcome onto Contempt.

The result of this move is a 1-star obstacle, perhaps. Well, good.
Contempt to Surprise to Anticipation is still two jumps, but the
difficulty is lower. This time she makes the roll, and succeeds.

----

All well and good. So what are the specific mechanics for all this?
I'm not done yet, but here's some random thoughts:

If we're using the escalating die mechanic for the Disrupt phase,
then we're rolling d4, d6, d8, d10, and d12. Not every die needs
to be rolled. So we may have some dice left over. We'll roll
the leftovers. Whichever dice come up 4 or less contribute some
useful currency to Discover.

The difficulty of the Disrupt roll can be based on the star count:
1 for no-stars, 3 for 1 star, 6 for 2 star, 10 for 3 star, 15 for
4 star, and 21 for 5 star. This is a nice progression that maps neatly
to the average rolls on a given dice pool.

So our four-star fear obstacle means the knight needs to beat 15.
Say that she rolls 3, 5, 6, and 4, putting her 3 over.
Going back to our difficulty numbers earlier, we see 3 is a 1-star
obstacle, so we create that obstacle on Contempt.

We could have declared that it goes anywhere. The knight could 
roll the d12 she left behind, and if she got 4 or less, it'd
contribute a token toward Discovery for her. She rolls a 10
and fails, but her backstory lets her get a free Discovery token instead.
With that token, she gets to choose any unoccupied square and place
the obstacle there.

The crisis itself, and the community of people, can affect the
tokens that emerge from Discovery. For example,
For example, the GM could create a family who'd lost people to the
Bronze Horde, creating a source of Anguish. Tracing a path through
Anguish would have required this obstacle to be overcome as well.
