<script>
  import { fade } from 'svelte/transition'
  import CatalyticSoundImage from '../../../assets/catalytic-sound.png'
  import StreamImage from '../../../assets/stream.png'
  import { padding, logoHover } from '../../stores.js'

  let logoVisible = true
  
  const refreshLogo = (logoHover) => {
    if (logoHover) {
      logoVisible = false
      setTimeout(() => {
        logoVisible = true
      }, 200)
    }
  }

  $: refreshLogo($logoHover)
</script>
 
<a 
  href='https://catalyticsound.com/' 
  target="_blank" 
  rel="noopener noreferrer" 
  style='--padding:{$padding}px' 
  on:mouseenter={() => logoHover.set(true)}
  on:mouseleave={() => logoHover.set(false)} >
  <div class='left-logo'>
    <img 
      class='catalytic-sound' 
      src={CatalyticSoundImage} 
      alt='Catalytic Sound' />
    {#if logoVisible}
      <div out:fade="{{duration: 200 }}" class='divider'></div>
    {/if}
  </div>
  {#if logoVisible}
    <img 
      out:fade="{{duration: 200 }}"
      class='stream'
      src={StreamImage} 
      alt='Stream' />
  {/if}
</a>

<style>
  a {
    padding-left: var(--padding);
    display: flex;
    flex-direction: row;
    align-items: center;
  }

  img {
    height: 80px;
  }

  .left-logo {
    display: flex;
    flex-direction: row;
    align-items: center;
    background-color: var(--light-grey);
  }

  .divider {
    width: 2px;
    background-color: var(--medium-grey);
    height: 32px;
    border-radius: 1px;
    animation: expand .2s ease-in-out 1.4s;
    animation-fill-mode: both;
  }

  .catalytic-sound {
    animation: fade-in .4s ease-in;
    animation-fill-mode: both;
    background-color: var(--light-grey);
    margin-right: 4px;
  }

  .stream {
    position: relative;
    opacity: 0;
    z-index: -1;
    margin-left: 4px;
    animation: slide .4s ease-out 1.6s forwards;
    animation-fill-mode: both;
  }

  @keyframes slide {
    from {
      left: -150px;
    }
    to {
      left: 0px;
      opacity: 1;
    }
  }

  @keyframes expand {
    0% {
       opacity: 0;
      transform: rotateX(87deg);
    }

    50% {
      opacity: 1;
    }

    100% {
      opacity: 1;
      transform: rotateX(0deg);
    }
  }
</style>