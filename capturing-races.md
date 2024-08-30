---
layout: page
title: Capturing Races
---

## Liberties

It's important to update our definition of liberties.
When we first learned Go, we were probably taught that a group's liberties are the number of adjacent empty intersections.
That definition is not very helpful when it comes to capturing races, where one should also account for approaching moves that are not strictly adjacent, and for free forcing moves.
Let us update it to a new more practical one.

<table class="table table-hover table-sm">
    <thead>
        <tr>
          <th></th>
          <th scope="col">Number of Liberties</th>
        </tr>
    </thead>
    <tbody class="table-group-divider">
        <tr>
              <th scope="row">Old definition<br/>a.k.a. <em>primary</em> liberties</th>
              <td>Number of empty adjacent intersections.</td>
        </tr>
        <tr>
              <th scope="row">New definition<br/>a.k.a. <em>secondary</em> liberties</th>
              <td>Net number of moves necessary for capture.</td>
        </tr>
    </tbody>
</table>

Other resources on capturing races have various names for these types of liberties.
We use *primary* liberties to refer to the old definition, and *secondary* liberties to refer to the new definition.
If we do not specify *primary* or *secondary*, we are referring to *secondary* liberties by default.

### Approach Moves

Approach moves are moves that are not strictly adjacent to the group, but are necessary to capture it.
These are moves that do not count asprimary liberties, but they do count as secondary liberties.

{% include example.html name="approaching-move-1" %}
{% include example.html name="approaching-move-2" %}

Note that, depending on context, an approaching move may be avoided if the corresponding liberty is left for last.
Always be careful to read the capture sequence to determine whether an approach move is necessary.

{% include example.html name="approaching-move-3" %}

### Forcing Moves

The opposite can also happen, where an intersection may count as a primary liberty, but not as a secondary liberty.
A common example is in forcing moves which the opponent must respond to.
Since the opponent must respond, it means that they don't get to make progress on their side of the capture race with that move, which is a net positive for the player with the forcing move.

{% include example.html name="bamboo-joint" %}
{% include example.html name="throw-in" %}

## Eyes and their Liberties

The presence and size of eyes is of primary importance in determining the outcome of a capturing race.
For that purpose, it's helpful to figure out how many liberties are associated with an eye of a given size.

Let $n$ denote the size of the eye, and $\liberties(n)$ denote the liberties.

### Small Eyes vs Big Eyes

We must distinguish between small and big eyes, as they have different properties.

<table class="table table-hover table-sm">
    <thead>
        <tr>
            <th></th>
            <th scope="col">Size $n$</th>
            <th scope="col">Liberties</th>
        </tr>
    </thead>
    <tbody class="table-group-divider">
        <tr>
            <th scope="row">Small Eye</th>
            <td>1-3</td>
            <td>$\liberties(n) = n$</td>
        </tr>
        <tr>
            <th scope="row">Big Eye</th>
            <td>4+</td>
            <td>$\liberties(n) > n$</td>
        </tr>
    </tbody>
</table>

Eyes are said to be of the <em>same-size</em> if they are either:
- literally of the same size, i.e., $n$-eye vs $n$-eye, or
- both small, e.g., 1-eye vs 3-eye are "same-size".

### The Liberties Function

There's two approaches to learning the mapping from eye size to liberties:
You can:
- simply memorize the few relevant cases, or
- learn the general formula.

Neither is superior to the other, so pick whichever fits best with your learning style.
If you're mathematically inclined, you may prefer the formula, but if you're not, you may prefer to memorize the few relevant cases.

#### Liberties Table

If you'd rather just memorize the values, here are the relevant ones:

<table class="table table-hover table-sm">
    <tbody>
        <tr>
            <th scope="col">$n$</th>
            <td class="text-end">1</td>
            <td class="text-end">2</td>
            <td class="text-end">3</td>
            <td class="text-end">4</td>
            <td class="text-end">5</td>
            <td class="text-end">6</td>
            <td class="text-end">7</td>
        </tr>
        <tr>
            <th scope="col">$\liberties(n)$</th>
            <td class="text-end">1</td>
            <td class="text-end">2</td>
            <td class="text-end">3</td>
            <td class="text-end">5</td>
            <td class="text-end">8</td>
            <td class="text-end">12</td>
            <td class="text-end">17</td>
        </tr>
    </tbody>
</table>

#### Liberties Formula

If you'd rather learn the general formula, it is as follows.
For small eyes, the formula for liberties is very simple,

$$
\liberties(n) = n \,.
$$

For big eyes, the formula becomes only slightly more complex,

$$
\liberties(n) = \triangular(n-2) + 2 \,.
$$

where the triangular function is defined as follows (also see [triangular numbers](https://en.wikipedia.org/wiki/Triangular_number), easily memorized, e.g., if you're a fan of [killer sudoku](https://en.wikipedia.org/wiki/Killer_sudoku) or [kakuro](https://en.wikipedia.org/wiki/Kakuro)),

$$
\begin{align}
\triangular(n) &= \sum_{i=1}^n i \\
&= \begin{cases}
    1, & \text{ if } n = 1, \\
    n + \triangular(n-1), & \text{ otherwise},
\end{cases} \\
&= \frac{n(n+1)}{2} \,.
\end{align}
$$

For completeness, here are the relevant values of the triangular function:

<table class="table table-hover table-sm">
    <tbody>
        <tr>
            <th scope="row">$n$</th>
            <td class="text-end">1</td>
            <td class="text-end">2</td>
            <td class="text-end">3</td>
            <td class="text-end">4</td>
            <td class="text-end">5</td>
        </tr>
        <tr>
            <th scope="row">$\triangular(n)$</th>
            <td class="text-end">1</td>
            <td class="text-end">3</td>
            <td class="text-end">6</td>
            <td class="text-end">10</td>
            <td class="text-end">15</td>
        </tr>
    </tbody>
</table>

In practice, I use this method because I am already familiar with the triangular function, and I find the formula to be simpler to memorize than the raw values.
When I need to apply the formula, I simply go through three steps shown below.

<table class="table table-hover table-sm">
    <thead>
        <tr>
            <th scope="col">Start</th>
            <th scope="col">$n$</th>
            <th scope="col" class="text-end">4</th>
            <th scope="col" class="text-end">5</th>
            <th scope="col" class="text-end">6</th>
            <th scope="col" class="text-end">7</th>
        </tr>
    </thead>
    <tbody class="table-group-divider">
        <tr>
            <td>Subtract 2</td>
            <td scope="col">$n-2$</td>
            <td class="text-end">2</td>
            <td class="text-end">3</td>
            <td class="text-end">4</td>
            <td class="text-end">5</td>
        </tr>
        <tr>
            <td>Map triangular</td>
            <td>$\triangular(n-2)$</td>
            <td class="text-end">3</td>
            <td class="text-end">6</td>
            <td class="text-end">10</td>
            <td class="text-end">15</td>
        </tr>
        <tr>
            <td>Add 2</td>
            <td>$\triangular(n-2) + 2$</td>
            <td class="text-end">5</td>
            <td class="text-end">8</td>
            <td class="text-end">12</td>
            <td class="text-end">17</td>
        </tr>
    </tbody>
    <thead class="table-group-divider">
        <tr>
            <th>End</th>
            <th>$\liberties(n)$</th>
            <th class="text-end">5</th>
            <th class="text-end">8</th>
            <th class="text-end">12</th>
            <th class="text-end">17</th>
        </tr>
    </thead>
</table>

### Non-Empty Eyes

So far, we have only considered empty eyes.
How do we account for eyes that are not empty?
The answer is simple: first, count the liberties as if the eye were empty, then subtract the number of moves that have already been played inside the eye.

{% include example.html name="non-empty-eye" %}

## Capturing Race Rules

Finally, using the terminology and knowledge above, we can discuss the rules of capturing races.
Generally speaking, the process to determine the outcome of a capturing race requires the following steps:
1. Identify problem type (number and size of eyes, number of shared liberties)
2. Identify groups (favorite vs underdog)
3. Count stuff (variables F and U, respectively for favorite and underdog)
4. Determine outcome based on F and U

<div class="alert alert-secondary" role="alert">
  <i class="bi bi-exclamation-triangle-fill flex-shrink-0 me-2"></i>
  <strong>Note:</strong>
  The variables F and U used to determine the outcome are related to liberties, but they are not equivalent to liberties.
  It is important to keep in mind that F and U are used to determine the outcomes, but the number of moves necessary to capture the opponent, i.e., the liberties, may be a different value.
</div>

<table id="rules" class="table table-hover table-sm">
    <thead>
        <tr>
            <th scope="col">Race Type</th>
            <th scope="col">Favorite (F)</th>
            <th scope="col">Underdog (U)</th>
            <th scope="col">Outcomes</th>
        </tr>
    </thead>
    <tbody class="table-group-divider">
        <tr>
            <td class="align-middle">
                <strong>Eyes:</strong> None
                <br/>
                <strong>Shared libs:</strong> 0-1
            </td>
            <td class="align-middle">
                <strong>Who:</strong> Group with more libs
                <br/>
                <strong>Goal:</strong> Kill
                <br/>
                <strong>Variable:</strong> N/A
            </td>
            <td class="align-middle">
                <strong>Who:</strong> Group with fewer libs
                <br/>
                <strong>Goal:</strong> Kill
                <br/>
                <strong>Variable:</strong> N/A
            </td>
            <td class="align-middle">Favorite wins, underdog dies.</td>
        </tr>
        <tr>
            <td class="align-middle">
                <strong>Eyes:</strong> None
                <br/>
                <strong>Shared libs:</strong> 2+
            </td>
            <td class="align-middle">
                <strong>Who:</strong> Group with more libs
                <br/>
                <strong>Goal:</strong> Kill
                <br/>
                <strong>Variable:</strong> F = Exclusive libs + 1
            </td>
            <td class="align-middle">
                <strong>Who:</strong> Group with fewer libs
                <br/>
                <strong>Goal:</strong> Seki
                <br/>
                <strong>Variable:</strong> U = Exclusive libs + shared libs
            </td>
            <td class="align-middle">
                <strong>F &gt; U:</strong> favorite wins, underdog dies.
                <br/>
                <strong>F = U:</strong> unsettled, first player wins.
                <br/>
                <strong>F &lt; U:</strong> underdog wins, seki.
            </td>
        </tr>
        <tr>
            <td class="align-middle">
                <strong>Eyes:</strong> Eye vs same-size eye
                <br/>
                <strong>Shared libs:</strong> 0
            </td>
            <td class="align-middle">
                <strong>Who:</strong> Group with more libs
                <br/>
                <strong>Goal:</strong> Kill
                <br/>
                <strong>Variable:</strong> N/A
            </td>
            <td class="align-middle">
                <strong>Who:</strong> Group with fewer libs
                <br/>
                <strong>Goal:</strong> Kill
                <br/>
                <strong>Variable:</strong> N/A
            </td>
            <td class="align-middle">Favorite wins, underdog dies.</td>
        </tr>
        <tr>
            <td class="align-middle">
                <strong>Eyes:</strong> Eye vs same-size eye
                <br/>
                <strong>Shared libs:</strong> 1+
            </td>
            <td class="align-middle">
                <strong>Who:</strong> Group with more libs
                <br/>
                <strong>Goal:</strong> Kill
                <br/>
                <strong>Variable:</strong> F = Exclusive libs
            </td>
            <td class="align-middle">
                <strong>Who:</strong> Group with fewer libs
                <br/>
                <strong>Goal:</strong> Seki
                <br/>
                <strong>Variable:</strong> U = Exclusive libs + shared libs
            </td>
            <td class="align-middle">
                <strong>F &gt; U:</strong> favorite wins, underdog dies.
                <br/>
                <strong>F = U:</strong> unsettled, first player wins.
                <br/>
                <strong>F &lt; U:</strong> underdog wins, seki.
            </td>
        </tr>
        <tr>
            <td class="align-middle">
                <strong>Eyes:</strong> Eye vs no eye
            </td>
            <td class="align-middle">
                <strong>Who:</strong> Group with eye
                <br/>
                <strong>Goal:</strong> Kill
                <br/>
                <strong>Variable:</strong> F = Exclusive libs + shared libs
            </td>
            <td class="align-middle">
                <strong>Who:</strong> Group with no eye
                <br/>
                <strong>Goal:</strong> Kill
                <br/>
                <strong>Variable:</strong> U = Exclusive libs
            </td>
            <td class="align-middle">
                <strong>F &gt; U:</strong> favorite wins, underdog dies.
                <br/>
                <strong>F = U:</strong> unsettled, first player wins.
                <br/>
                <strong>F &lt; U:</strong> underdog wins, favorite dies.
            </td>
        </tr>
        <tr>
            <td class="align-middle">
                <strong>Eyes:</strong> Big eye vs smaller eye
            </td>
            <td class="align-middle">
                <strong>Who:</strong> Group with big eye
                <br/>
                <strong>Goal:</strong> Kill
                <br/>
                <strong>Variable:</strong> F = Exclusive libs + shared libs
            </td>
            <td class="align-middle">
                <strong>Who:</strong> Group with smaller eye
                <br/>
                <strong>Goal:</strong> Kill
                <br/>
                <strong>Variable:</strong> U = Exclusive libs
            </td>
            <td class="align-middle">
                <strong>F &gt; U:</strong> favorite wins, underdog dies.
                <br/>
                <strong>F = U:</strong> unsettled, first player wins.
                <br/>
                <strong>F &lt; U:</strong> underdog wins, favorite dies.
            </td>
        </tr>
    </tbody>
</table>

### Rules Summary

Though each case in the table is in some aspect different from the others, there are some common themes that arise and that can be useful to memorize the rules:
- The favorite's goal is always to kill.
- The underdog's goal is always to kill or to live in seki.
- Seki is only possible if:
    - Both players have the same-size eye or no eyes at all.
    - The underdog has at least as many liberties as the favorite.
    - There is at least one shared liberty (if eyes are present) and at least two shared liberties (if no eyes are present).
- If the eyes are uneven, the shared liberties only count for the favorite.
- The eye-vs-no-eye and big-eye-vs-smaller-eye cases follow the same rule, a bigger eye gives the same advantages as the opponent having none.
