Subtle css animations


## Levitate 

<div style="font-size:24px;text-align:center;margin-bottom:1rem;" class="levitate">
    🌟
</div>

<style>
.levitate {
  animation: levitate 2s alternate infinite ease-in-out;
}

@keyframes levitate {
  0% {
    transform: translateY(0);
  }
  100% {
      transform: translateY(-10px);
  }
}
</style>

```css
.levitate {
  animation: levitate 2s alternate infinite ease-in-out;
}

@keyframes levitate {
  0% {
    transform: translateY(0);
  }
  100% {
      transform: translateY(-10px);
  }
}

```


## Bounce


<div style="font-size:24px;text-align:center;margin-bottom:1rem;" class="bounce">
  🌟
</div>

<style>
.bounce {
  animation: bounce 1s infinite ;
}

@keyframes bounce {
0% {
    transform: scale(1) translateY(0);
}
10% {
    transform: scale(var(--fa-bounce-start-scale-x,1.1),var(--fa-bounce-start-scale-y,.9)) translateY(0);
}

30% {
    transform: scale(var(--fa-bounce-jump-scale-x,.9),var(--fa-bounce-jump-scale-y,1.1)) translateY(var(--fa-bounce-height,-.5em));
}
50% {
    transform: scale(var(--fa-bounce-land-scale-x,1.05),var(--fa-bounce-land-scale-y,.95)) translateY(0);
}
57% {
    transform: scale(1) translateY(var(--fa-bounce-rebound,-.125em));
}
64% {
    transform: scale(1) translateY(0);
}
100% {
    transform: scale(1) translateY(0);
}
}
  </style>
    
    
```css 

.bounce {
  animation: bounce 2s infinite ease-in-out;
}

@keyframes bounce {
  0% {
      transform: scale(1) translateY(0);
  }
  10% {
      transform: scale(var(--fa-bounce-start-scale-x,1.1),var(--fa-bounce-start-scale-y,.9)) translateY(0);
  }
  30% {
      transform: scale(var(--fa-bounce-jump-scale-x,.9),var(--fa-bounce-jump-scale-y,1.1)) translateY(var(--fa-bounce-height,-.5em));
  }
  50% {
      transform: scale(var(--fa-bounce-land-scale-x,1.05),var(--fa-bounce-land-scale-y,.95)) translateY(0);
  }
  57% {
      transform: scale(1) translateY(var(--fa-bounce-rebound,-.125em));
  }
  64% {
      transform: scale(1) translateY(0);
  }
  100% {
      transform: scale(1) translateY(0);
  }
}
```