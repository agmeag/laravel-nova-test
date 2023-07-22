import Nova from 'laravel-nova';

Nova.booting((Vue, router, store) => {
    Vue.component('onboarding-steps', require('./Onboarding.vue'));
});