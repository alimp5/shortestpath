context("spgraph")

test_that("as.spgraph.igraph adds all required attributes", {
    g <- make_graph("Tetrahedral")
    set.seed(1)
    spgraph <- as.spgraph(g)
    expect_true(is.spgraph(spgraph))
    expect_equal(V(spgraph)$name[1], "A")
    expect_equal(E(spgraph)$weight[1], 1)
    dists <- matrix(Inf,ncol=4,nrow=4)
    diag(dists) <- 0
    colnames(dists) <- rownames(dists) <- c("A", "B", "C", "D")
    expect_equal(spgraph$min_dists, dists)
    expect_equal(spgraph$shortest_path_predecessors[[1, 1]], NULL)
    expect_equal(spgraph$from, FALSE)
    expect_equal(spgraph$to, FALSE)
    expect_true(is.numeric(V(spgraph)$x))
})

test_that("is.spgraph is working as expected", {
    expect_true(is.spgraph(randomGraph()))
    expect_false(is.spgraph(make_graph('Tetrahedral')))
    expect_false(is.spgraph(NULL))
})

test_that("print.spgraph is working as expected", {
    r <- randomGraph()
    expect_output(print(r), "SPGRAPH")
})

test_that("summary.spgraph is working as expected", {
    r <- randomGraph()
    expect_output(summary(r), "SPGRAPH")
})
