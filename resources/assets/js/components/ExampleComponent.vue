<template>
    <v-container>
        <v-layout row>
            <v-flex>
                <v-card>
                    <v-toolbar color="primary">
                        <v-btn disabled icon>
                            <v-icon>label_important</v-icon>
                        </v-btn>
                        <v-toolbar-title>Example Component</v-toolbar-title>
                        <v-spacer></v-spacer>
                    </v-toolbar>
                    <v-card-text>
                        I'm an example component.
                    </v-card-text>
                </v-card>
            </v-flex>
        </v-layout>
    </v-container>
</template>

<script>
    export default {
        mounted() {
            console.log('Component mounted.')
        }
    }
</script>
