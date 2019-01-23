import axios from '../../api/axios'

const state = {
  all: [],
  fetched: false,
}

const getters = {}

const actions = {
  fetchAllSongs ({ commit }) {
    commit('fetching')
    axios.get('/api/songs.json').then(function(response) {
      commit('setSongs', response.data)
      commit('fetched')
    })
  },
  reloadAllSongs ({ commit }) {
    axios.get('/api/songs.json').then(function(response) {
      commit('setSongs', response.data)
    })
  },
  singing ({ commit, dispatch }, payload) {
    axios.get(`/songs/${payload.id}/singing.json`).then(function(response) {
      dispatch('reloadAllSongs')
    })
  }
}

const mutations = {
  setSongs (state, songs) {
    state.all = songs
  },
  fetching (state) {
    state.fetched = false
  },
  fetched (state) {
    state.fetched = true
  },
  setSongToSinging (state, payload) {
    const newSongs = state.all.filter(function(v){
      return v.id !== payload.id
    })
    state.all = newSongs.concat(payload.response)
  }
}

export default {
  namespaced: true,
  state,
  getters,
  actions,
  mutations
}
