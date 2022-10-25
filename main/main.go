package main

import "net/http"
import "log"
import "fmt"


func homePage(respose http.ResponseWriter, r *http.Request){
	fmt.Printf("Welcome to the Go Web API!")
	fmt.Println("Endpoint Hit: homePage")
}

func aboutMe(respose http.ResponseWriter, r *http.Request){
	who := "RobertoMowers"

	fmt.Fprintf(response, "A little bit about Roberto Mowers")
	fmt.Println("Endpoint Hit: ",who)
}

func request(){
	http.HandleFunc("/",homePage)
	http.HandleFunc("/aboutme",aboutMe)

	log.Fatal(http.ListenAndServe(":3000",nil))
}
