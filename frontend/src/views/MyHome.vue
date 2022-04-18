<!--Ce composant comprend d'autres composant afin de gerer le rendu de l'application -->
<template>
  <div class="home">
    <div class="container">
      <Post />
    </div>
  </div>
</template>

<style lang="scss" scoped></style>

<script>
// @ is an alias to /src
import Post from "@/components/MyPost.vue";

export default {
  name: "MyHome",
  components: {
    Post,
  },
};
</script>
