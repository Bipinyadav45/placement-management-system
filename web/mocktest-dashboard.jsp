<%-- 
    Document   : mocktest-dashboard
    Created on : 17 Feb 2026, 8:12:57 pm
    Author     : defaultuser0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Mock Test Dashboard</title>

<style>
body{
    margin:0;
    font-family: Arial, sans-serif;
    background:#f4f6f9;
}
.header{
    background:#4e63d7;
    color:white;
    padding:15px 30px;
    font-size:22px;
    font-weight:bold;
}
.container{
    padding:30px;
}
.stats{
    display:grid;
    grid-template-columns:repeat(4,1fr);
    gap:20px;
    margin-bottom:30px;
}
.card{
    background:white;
    padding:20px;
    border-radius:10px;
    box-shadow:0 2px 6px rgba(0,0,0,0.1);
}
.card h2{
    margin:0;
    font-size:28px;
}
.card p{
    color:gray;
    margin-top:5px;
}

.top-bar{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-bottom:20px;
}
.filters{
    display:flex;
    gap:10px;
}
.filter-btn{
    padding:6px 14px;
    border-radius:20px;
    border:1px solid #d1d5db;
    background:white;
    cursor:pointer;
    font-size:13px;
}
.filter-btn.active{
    background:#2563eb;
    color:white;
    border:none;
}
.search-box input{
    padding:8px 12px;
    border-radius:20px;
    border:1px solid #ccc;
    outline:none;
}

.tests{
    display:grid;
    grid-template-columns:repeat(3,1fr);
    gap:25px;
}
.test-card{
    background:white;
    padding:20px;
    border-radius:12px;
    box-shadow:0 3px 8px rgba(0,0,0,0.1);
}
.test-card h3{
    margin-top:0;
}
.badge{
    display:inline-block;
    padding:5px 10px;
    font-size:12px;
    border-radius:20px;
    background:#e0e7ff;
    color:#1e3a8a;
    margin-bottom:10px;
}
.btn{
    display:block;
    margin-top:15px;
    padding:10px;
    text-align:center;
    background:#2563eb;
    color:white;
    border-radius:6px;
    text-decoration:none;
    font-weight:bold;
}
.btn:hover{
    background:#1d4ed8;
}
</style>

</head>
<body>

<div class="header">
    Placement Portal – Mock Test Dashboard
</div>

<div class="container">

    <!-- MOCK TEST HEADER + FILTERS -->
    <div class="top-bar">
        <div>
            <h2 style="margin:0;">Mock Tests</h2>
            <div class="filters">
                <button class="filter-btn active">All</button>
                <button class="filter-btn">Aptitude</button>
                <button class="filter-btn">Reasoning</button>
                <button class="filter-btn">English</button>
                <button class="filter-btn">Technical</button>
                <button class="filter-btn">General</button>
            </div>
        </div>

        <div class="search-box">
            <input type="text" id="searchInput" placeholder="Search tests...">
        </div>
    </div>

    <!-- TEST LIST -->
    <div class="tests">

        <div class="test-card" data-title="Quantitative Aptitude" data-category="Aptitude">
            <span class="badge">Aptitude · Medium</span>
            <h3>Quantitative Aptitude</h3>
            <p>Percentages, Profit & Loss, Time & Work</p>
            <a href="TestServlet?id=1" class="btn">Aptitude Test</a>
        </div>

        <div class="test-card" data-title="Logical Reasoning" data-category="Reasoning">
            <span class="badge">Reasoning · Easy</span>
            <h3>Logical Reasoning</h3>
            <p>Patterns, Series, Logical Puzzles</p>
            <a href="TestServlet?id=2" class="btn">Reasoning Test</a>
        </div>

        <div class="test-card" data-title="Verbal Ability" data-category="English">
            <span class="badge">English · Easy</span>
            <h3>Verbal Ability</h3>
            <p>Grammar, Vocabulary, Comprehension</p>
            <a href="TestServlet?id=3" class="btn">English Test</a>
        </div>

        <div class="test-card" data-title="Data Structures & Algorithms" data-category="Technical">
            <span class="badge">Technical · Hard</span>
            <h3>Data Structures & Algorithms</h3>
            <p>Arrays, Trees, Sorting, Complexity</p>
            <a href="TestServlet?id=4" class="btn">DSA Test</a>
        </div>

        <div class="test-card" data-title="Database Management SQL" data-category="Technical">
            <span class="badge">Technical · Medium</span>
            <h3>Database Management (SQL)</h3>
            <p>Queries, Joins, Normalization</p>
            <a href="TestServlet?id=5" class="btn">SQL Test</a>
        </div>

        <div class="test-card" data-title="General Knowledge" data-category="General">
            <span class="badge">General · Easy</span>
            <h3>General Knowledge</h3>
            <p>Current Affairs & Static GK</p>
            <a href="TestServlet?id=6" class="btn">GK Test</a>
        </div>

    </div>

</div>

<script>
const searchInput = document.getElementById("searchInput");
const buttons = document.querySelectorAll(".filter-btn");
const cards = document.querySelectorAll(".test-card");

let activeCategory = "All";

function filterCards() {
    let searchValue = searchInput.value.toLowerCase();

    cards.forEach(card => {
        let title = card.getAttribute("data-title").toLowerCase();
        let category = card.getAttribute("data-category");

        let matchSearch = title.includes(searchValue);
        let matchCategory = (activeCategory === "All" || category === activeCategory);

        if (matchSearch && matchCategory) {
            card.style.display = "block";
        } else {
            card.style.display = "none";
        }
    });
}

searchInput.addEventListener("keyup", filterCards);

buttons.forEach(button => {
    button.addEventListener("click", function() {

        document.querySelector(".filter-btn.active")?.classList.remove("active");
        this.classList.add("active");

        activeCategory = this.textContent.trim();
        filterCards();
    });
});
</script>

</body>
</html>

