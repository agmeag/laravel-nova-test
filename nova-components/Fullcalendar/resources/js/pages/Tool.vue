<script>
import FullCalendar from "@fullcalendar/vue3";
import dayGridPlugin from "@fullcalendar/daygrid";
import interactionPlugin from "@fullcalendar/interaction";

export default {
    components: {
        FullCalendar, // make the <FullCalendar> tag available
    },
    props: {
        usersData: {
            type: Array,
            required: true,
        },
    },
    mounted() {
        console.log(this.usersData); // Check if 'usersData' is available in the Vue component
        this.dataFromTool = this.usersData;
        this.fetchData();
    },
    data() {
        return {
            calendarOptions: {
                plugins: [dayGridPlugin, interactionPlugin],
                initialView: "dayGridMonth",
                events: [], // Set the events property with the transformed data
                // Other FullCalendar options and callbacks can be added here
            },
            dataFromTool: [],
        };
    },
    methods: {
        fetchData() {
            Nova.request()
                .get("/api/users")
                .then((response) => {
                    let dataFromTool = response.data;
                    this.calendarOptions.events = dataFromTool.map((user) => {
                        return {
                            title: user.name,
                            date: user.created_at,
                        };
                    });
                })
                .catch((error) => {
                    console.error("Error fetching data:", error);
                });
        },
    },
};
</script>
<template>
    <FullCalendar :options="calendarOptions">
        <template v-slot:eventContent="arg">
            <i style="color: white; font-size: 15px;">{{ arg.event.title }}</i>
        </template>
    </FullCalendar>
</template>
