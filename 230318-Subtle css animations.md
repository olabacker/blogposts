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