<template>
<div class="container">
  <h1 class="text-center mb-5">Filmajánló</h1>

  <!-- TODO: külön componentbe rakni -->
  <div class="row">
    <div class="col-md">
      <h3>Szimpatikus:</h3>
      <div v-for="(kategoria, index) in kategoriak" :key="index" class="form-check">
        <input type="checkbox" :id="kategoria" :value="kategoria" v-model="szimpatikus" class="form-check-input" :disabled="unszimpatikus.includes(kategoria)">
        <label :for="kategoria" class="form-check-label">{{ kategoria }}</label>
      </div>
       <!-- {{ szimpatikus }} -->
    </div>
  

    <div class="col-md">
      <h3>Unszimpatikus:</h3> 
      <div v-for="(kategoria, index) in kategoriak" :key="index" class="form-check">
        <input type="checkbox" :id="'un' + kategoria" :value="kategoria" v-model="unszimpatikus" class="form-check-input" :disabled="szimpatikus.includes(kategoria)">
        <label :for="'un' + kategoria" class="form-check-label">{{ kategoria }}</label>
      </div>
      <!-- {{ unszimpatikus }} -->
    </div>

    <!-- <button @click="szures" class="btn btn-primary">Szűrés</button> -->

    <table class="table">
      <thead>
        <tr>
          <th scope="col">#</th>
          <th scope="col">Név</th>
          <th scope="col">Megjelenési dátum</th>
          <th scope="col">Kategória</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(film,index) in filmek" :key="index">
          <th scope="row">{{ index + 1 }}</th>
          <td>{{ film.nev }}</td>
          <td>{{ film.megjelenes_datum }}</td>
          <td>{{ film.kategoria }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</div>
</template>

<script>
export default {
  name: 'MainSite',
  data() {
    return {
      kategoriak: ['Horror', 'Kaland', 'Akció', 'Vígjáték', 'Krimi', 'Gyerek', 'Sci-fi', 'Fantasy'],
      szimpatikus: [],
      unszimpatikus: [],
      filmek: [],
    }
  },
  mounted() {
    fetch('/all').then(response => response.json()).then(data => {
      this.filmek = data;
    });
  },
  methods: {
    szures() {
      let data = {
        szimpatikus: this.szimpatikus,
        unszimpatikus: this.unszimpatikus,
      };

      fetch('/filtered', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(data),
      })
      .then(response => response.json())
      .then(data => {
        this.filmek = data;
      }).catch(error => {
        console.error('Error: ', error);
      });
    }
  }
  watch: {
    szimpatikus () {
       this.szures();
    },
    unszimpatikus () {
       this.szures();
    },
  },
}
</script>

<style scoped>
</style>
