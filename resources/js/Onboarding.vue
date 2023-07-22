<template>
    <div>
        <vue-onboarding ref="onboarding">
            <template v-slot:content="{ step, nextStep }">
                <div v-if="step === 1">
                    <!-- First step onboarding text -->
                    <p>{{ onboardingTexts.step1 }}</p>
                    <button @click="nextStep">Next</button>
                </div>
                <div v-else-if="step === 2">
                    <!-- Second step onboarding text -->
                    <p>{{ onboardingTexts.step2 }}</p>
                    <button @click="nextStep">Next</button>
                </div>
                <div v-else-if="step === 3">
                    <!-- Third step onboarding text -->
                    <p>{{ onboardingTexts.step3 }}</p>
                    <button @click="endOnboarding">Finish</button>
                </div>
            </template>
        </vue-onboarding>
    </div>
</template>

<script>
export default {
    data() {
        return {
            onboardingTexts: {
                step1: "",
                step2: "",
                step3: "",
            },
        };
    },
    methods: {
        fetchOnboardingTexts() {
            // Fetch the onboarding texts from your API endpoint
            axios.get("/api/onboarding-texts").then((response) => {
                this.onboardingTexts = response.data;
            });
        },
        endOnboarding() {
            this.$refs.onboarding.close();
        },
    },
    mounted() {
        this.fetchOnboardingTexts();
    },
};
</script>
