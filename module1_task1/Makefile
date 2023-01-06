# Directorio de destino
DIST_DIR = dist

# Regla para construir
build:
	@mkdir -p $(DIST_DIR)
	@hugo

# Regla para limpiar
clean:
	@rm -rf $(DIST_DIR)

NEW_LINE = title: \"$(POST_TITLE)\"
# Regla para nuevo post
post:
	hugo new posts/$(POST_NAME).md
	@sed -i '1,2d' content/posts/$(POST_NAME).md
	@sed -i '1i ---' content/posts/$(POST_NAME).md
	@sed -i '2i $(NEW_LINE)' content/posts/$(POST_NAME).md
