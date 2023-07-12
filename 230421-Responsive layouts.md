Responsive layouts in css which are useful in many scenarios | [css]

<style>
  .parent {
    outline: 2px solid hotpink;
    padding: 1rem;
    margin-top: 1rem;
    margin-bottom: 1rem;
  }
  .child {
    outline: 1px solid white;
    background: blue;
    padding: 0.5rem;
  }
  .cluster {
    display: flex;
    flex-wrap: wrap;
    gap: 1rem;
}
.auto-grid {
  --min-col-size: 5rem;
  display: grid;
  gap: 1rem;
  grid-template-columns: repeat(auto-fit, minmax(var(--min-col-size), 1fr));
}

.flexible-grid {
  display: flex;
  flex-wrap: wrap;
  gap: 1rem;
}

.flexible-grid > * {
  flex: 1 ;
}

.reel{
  --gap: 1rem;
  display: grid;
  gap: var(--gap);
  grid-auto-flow: column;
  grid-auto-columns: 30%;
  overflow-x: scroll;
  scroll-snap-type: x mandatory;
  scroll-padding: var(--gap);
}

.reel > * {
  scroll-snap-align: start;
}
  </style>

## Cluster

<div class="parent cluster">
  <div class="child">The</div>
  <div class="child">night</div>
  <div class="child">is</div>
  <div class="child">darkest</div>
  <div class="child">just</div>
  <div class="child">before</div>
  <div class="child">dawn</div>
  <div class="child">.</div>
  <div class="child">And</div>
  <div class="child">I</div>
  <div class="child">promise</div>
  <div class="child">you</div>
  <div class="child">,</div>
  <div class="child">the</div>
  <div class="child">dawn</div>
  <div class="child">is</div>
  <div class="child">coming</div>
  <div class="child">.</div>
</div>

The cluster will simply wrap the children and use the least amount of space possible but will not grow to fill the available space.

```css
.cluster {
    display: flex;
    flex-wrap: wrap;
    gap: 1rem;
}
```


## Auto grid

<div class="parent auto-grid">
  <div class="child">The</div>
  <div class="child">night</div>
  <div class="child">is</div>
  <div class="child">darkest</div>
  <div class="child">just</div>
  <div class="child">before</div>
  <div class="child">dawn</div>
  <div class="child">.</div>
  <div class="child">And</div>
  <div class="child">I</div>
  <div class="child">promise</div>
  <div class="child">you</div>
  <div class="child">,</div>
  <div class="child">the</div>
  <div class="child">dawn</div>
  <div class="child">is</div>
  <div class="child">coming</div>
  <div class="child">.</div>
</div>

Create a grid automatically with a minimum column size.

```css
.auto-grid {
  --min-col-size: 22rem;
  display: grid;
  gap: 1rem;
  grid-template-columns: repeat(auto-fit, minmax(var(--min-col-size), 1fr));
}
```

## Flexible grid

<div class="parent flexible-grid">
  <div class="child">The</div>
  <div class="child">night</div>
  <div class="child">is</div>
  <div class="child">darkest</div>
  <div class="child">just</div>
  <div class="child">before</div>
  <div class="child">dawn</div>
  <div class="child">.</div>
  <div class="child">And</div>
  <div class="child">I</div>
  <div class="child">promise</div>
  <div class="child">you</div>
  <div class="child">,</div>
  <div class="child">the</div>
  <div class="child">dawn</div>
  <div class="child">is</div>
  <div class="child">coming</div>
  <div class="child">.</div>
</div>

Same as cluster but the children will grow to fill the available space.

```css
.flexible-grid {
  display: flex;
  flex-wrap: wrap;
  gap: 1rem;
}

.flexible-grid > * {
  flex: 1 ;
}
```

## Reel

<div class="parent reel">
  <div class="child">The</div>
  <div class="child">night</div>
  <div class="child">is</div>
  <div class="child">darkest</div>
  <div class="child">just</div>
  <div class="child">before</div>
  <div class="child">dawn</div>
  <div class="child">.</div>
  <div class="child">And</div>
  <div class="child">I</div>
  <div class="child">promise</div>
  <div class="child">you</div>
  <div class="child">,</div>
  <div class="child">the</div>
  <div class="child">dawn</div>
  <div class="child">is</div>
  <div class="child">coming</div>
  <div class="child">.</div>
</div>

Creates a horizontal scrollable reel with scroll snapping.

```css
.reel{
  --gap: 1rem;
  display: grid;
  gap: var(--gap);
  grid-auto-flow: column;
  grid-auto-columns: 30%;
  overflow-x: scroll;
  scroll-snap-type: x mandatory;
  scroll-padding: var(--gap);
}

.reel > * {
  scroll-snap-align: start;
}
```