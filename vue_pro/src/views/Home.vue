<template>
    <div>
        <Header @search_book="get_book_search"></Header>
        <Banner/>
        <BookList :search="search"></BookList>
        <Footer/>

    </div>


</template>

<script>
    import Header from '../components/header'
    import Footer from '../components/footer'
    import Banner from '../components/banner'
    // import FreeCourse from "../components/FreeCourse";
    import BookList from "../components/BookList";

    export default {
        name: 'Home',
        data() {
            return {
                search:'',
                // book_list:[],
                // book_count:0,
            }
        },

        created() {
        },
        methods: {
            get_book_search(val){
                this.search = val;
                console.log(this.search)
            }
        },
        components:
            {
                Header,
                Footer,
                Banner,
                BookList,
            }
    }


</script>
