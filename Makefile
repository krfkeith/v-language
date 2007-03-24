RELEASE=0.000

all:
	javac -Xlint:unchecked -d pkg v/*.java
	cp v/*.v pkg/v
	(cd pkg && jar -cmf v.mf v.jar v)

run:
	(cd pkg && java -jar v.jar)
test:
	cd pkg && java -jar v.jar ../scripts/test.v

clean:
	rm -rf pkg/v

release: all test
	rm -rf pkg/v_$(RELEASE)
	mkdir pkg/v_$(RELEASE)
	cp -r v pkg/v_$(RELEASE)
	cp -r scripts pkg/v_$(RELEASE)
	cp Makefile pkg/v_$(RELEASE)
	mkdir pkg/v_$(RELEASE)/pkg
	cp pkg/v.* pkg/v_$(RELEASE)/pkg
	cd pkg/ && \
		tar -cf v_$(RELEASE).tar \
	   		v_$(RELEASE)/pkg/v.* v_$(RELEASE)/v/*.java v_$(RELEASE)/v/java/*.java \
			v_$(RELEASE)/v/*.v v_$(RELEASE)/scripts/*.v v_$(RELEASE)/Makefile && \
		gzip -f v_$(RELEASE).tar && mv v_$(RELEASE).tar.gz ..