doc:
	rm -r _html/
	mkdir _html/
	find . -name "*.ml" | xargs grep -iL "checkpoint" | xargs ocamldoc -html -d _html
