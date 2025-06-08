@tool
class_name CreditsLabel
extends RichTextLabel

@export_file("*.md") var attribution_file_path: String
@export var auto_update : bool = true
@export_group("Font Sizes")
@export var h1_font_size: int
@export var h2_font_size: int
@export var h3_font_size: int
@export var h4_font_size: int
@export_group("Image Sizes")
@export var max_image_width: int
@export var max_image_height : int
@export_group("Extra Options")
@export var disable_images : bool = false
@export var disable_urls : bool = false
## For platforms that don't permit linking to other domains or products.
@export var disable_opening_links: bool = false

func load_file(file_path) -> String:
	var file_string = FileAccess.get_file_as_string(file_path)
	if file_string == null:
		push_warning("File open error: %s" % FileAccess.get_open_error())
		return ""
	return file_string

func regex_replace_imgs(credits:String) -> String:
	var regex = RegEx.new()
	var match_string := "!\\[([^\\]]*)\\]\\(([^\\)]*)\\)"
	var replace_string := ""
	if not disable_images:
		replace_string = "res://$2[/img]"
		if max_image_width:
			if max_image_height:
				replace_string = ("[img=%dx%d]" % [max_image_width, max_image_height]) + replace_string
			else:
				replace_string = ("[img=%d]" % [max_image_width]) + replace_string
		else:
			replace_string = "[img]" + replace_string
	regex.compile(match_string)
	regex.get_group_count()
	return regex.sub(credits, replace_string, true)

func regex_replace_urls(credits:String) -> String:
	var regex = RegEx.new()
	var match_string := "\\[([^\\]]*)\\]\\(([^\\)]*)\\)"
	var replace_string := "$1"
	if not disable_urls:
		replace_string = "[url=$2]$1[/url]"
	regex.compile(match_string)
	return regex.sub(credits, replace_string, true)

func regex_replace_titles(credits:String) -> String:
	var iter = 0
	var heading_font_sizes : Array[int] = [h1_font_size, h2_font_size, h3_font_size, h4_font_size]
	for heading_font_size in heading_font_sizes:
		iter += 1
		var regex = RegEx.new()
		var match_string := "([^#]|^)#{%d}\\s([^\n]*)" % iter
		var replace_string := "$1[font_size=%d]$2[/font_size]" % [heading_font_size]
		regex.compile(match_string)
		credits = regex.sub(credits, replace_string, true)
	return credits

func _update_text_from_file() -> void:
	var file_text : String = load_file(attribution_file_path)
	if file_text == "":
		return
	var _end_of_first_line = file_text.find("\n") + 1
	file_text = file_text.right(-_end_of_first_line) # Trims first line "ATTRIBUTION"
	file_text = regex_replace_imgs(file_text)
	file_text = regex_replace_urls(file_text)
	file_text = regex_replace_titles(file_text)
	text = "[center]%s[/center]" % [file_text]

func set_file_path(file_path:String) -> void:
	attribution_file_path = file_path
	_update_text_from_file()

func _on_meta_clicked(meta: String) -> void:
	if meta.begins_with("https://") and not disable_opening_links:
		var _err = OS.shell_open(meta)

func _ready() -> void:
	if not auto_update: return
	set_file_path(attribution_file_path)
