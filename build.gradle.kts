import org.gradle.api.tasks.Delete
import org.gradle.api.tasks.Copy

// Task to copy all files from .github to project root
tasks.register<Copy>("copyGithubToRoot") {
    description = "Copy all files from .github directory to project root"
    group = "setup"

    from(".github") {
        include("**/*")
    }
    into(".")

    // Overwrite existing files
    duplicatesStrategy = DuplicatesStrategy.INCLUDE
    includeEmptyDirs = false

    doFirst {
        println("Copying files from .github to project root...")
    }

    doLast {
        println("Successfully copied .github contents to project root")
    }
}

// Task to delete documents directory
tasks.register<Delete>("deleteDocuments") {
    description = "Delete documents directory and all its contents"
    group = "setup"

    delete("documents")

    doFirst {
        println("Deleting documents directory...")
    }

    doLast {
        println("Successfully deleted documents directory")
    }
}

// Create our own build task that runs our setup tasks
tasks.register("build") {
    description = "Build task that copies .github files to root and deletes documents"
    group = "build"

    dependsOn("copyGithubToRoot")
    finalizedBy("deleteDocuments")

    doLast {
        println("Build completed: .github files copied to root and documents directory deleted")
    }
}

// Create our own clean task
tasks.register("clean") {
    description = "Clean task that deletes documents directory"
    group = "build"

    dependsOn("deleteDocuments")

    doLast {
        println("Clean completed: documents directory deleted")
    }
}

// Default task configuration
defaultTasks("build")
