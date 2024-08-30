.PHONY: svgs-clean svgs svgs-force

sgf_render_command:= sgf-render
sgf_render_global_options:= --custom-style sgf-render-style.toml --shrink-wrap --no-board-labels

sgf_dir:= assets/sgfs
svg_dir:= assets/svgs

svg_targets:= \
	$(svg_dir)/liberties.approaching-moves.1.question.svg \
	$(svg_dir)/liberties.approaching-moves.2.question.svg \
	$(svg_dir)/liberties.approaching-moves.2.answer.svg \
	$(svg_dir)/liberties.approaching-moves.3.question.svg \
	$(svg_dir)/liberties.approaching-moves.3.answer.svg \
	$(svg_dir)/liberties.forcing-moves.bamboo.question.svg \
	$(svg_dir)/liberties.forcing-moves.bamboo.wrong.1.svg \
	$(svg_dir)/liberties.forcing-moves.bamboo.wrong.2.svg \
	$(svg_dir)/liberties.forcing-moves.bamboo.wrong.3.svg \
	$(svg_dir)/liberties.forcing-moves.bamboo.correct.1.svg \
	$(svg_dir)/liberties.forcing-moves.bamboo.correct.2.svg \
	$(svg_dir)/liberties.forcing-moves.bamboo.correct.3.svg \
	$(svg_dir)/liberties.forcing-moves.throw-in.question.svg \
	$(svg_dir)/liberties.forcing-moves.throw-in.wrong.1.svg \
	$(svg_dir)/liberties.forcing-moves.throw-in.wrong.2.svg \
	$(svg_dir)/liberties.forcing-moves.throw-in.wrong.3.svg \
	$(svg_dir)/liberties.forcing-moves.throw-in.correct.1.svg \
	$(svg_dir)/liberties.forcing-moves.throw-in.correct.2.svg \
	$(svg_dir)/liberties.forcing-moves.throw-in.correct.3.svg \
	$(svg_dir)/liberties.forcing-moves.throw-in.correct.4.svg \
	$(svg_dir)/liberties.big-eyes.svg \

svgs-clean:
	rm -f $(svg_dir)/*.svg

svgs: $(svg_targets)

svgs-force: svgs-clean svgs

$(svg_dir)/%.svg:
	$(sgf_render_command) $(sgf_render_global_options) $(sgf_render_target_options) $^ -o $@

$(svg_dir)/liberties.approaching-moves.1.question.svg: $(sgf_dir)/liberties.approaching-moves.sgf
$(svg_dir)/liberties.approaching-moves.1.question.svg: sgf_render_target_options:= --variation 0

$(svg_dir)/liberties.approaching-moves.2.question.svg: $(sgf_dir)/liberties.approaching-moves.sgf
$(svg_dir)/liberties.approaching-moves.2.question.svg: sgf_render_target_options:= --variation 1 --node-number 1

$(svg_dir)/liberties.approaching-moves.2.answer.svg: $(sgf_dir)/liberties.approaching-moves.sgf
$(svg_dir)/liberties.approaching-moves.2.answer.svg: sgf_render_target_options:= --variation 1

$(svg_dir)/liberties.approaching-moves.3.question.svg: $(sgf_dir)/liberties.approaching-moves.sgf
$(svg_dir)/liberties.approaching-moves.3.question.svg: sgf_render_target_options:= --variation 2 --node-number 1

$(svg_dir)/liberties.approaching-moves.3.answer.svg: $(sgf_dir)/liberties.approaching-moves.sgf
$(svg_dir)/liberties.approaching-moves.3.answer.svg: sgf_render_target_options:= --variation 2

$(svg_dir)/liberties.forcing-moves.bamboo.question.svg: $(sgf_dir)/liberties.forcing-moves.bamboo.sgf
$(svg_dir)/liberties.forcing-moves.bamboo.question.svg: sgf_render_target_options:= --variation 0 --node-number 1

$(svg_dir)/liberties.forcing-moves.bamboo.wrong.1.svg: $(sgf_dir)/liberties.forcing-moves.bamboo.sgf
$(svg_dir)/liberties.forcing-moves.bamboo.wrong.1.svg: sgf_render_target_options:= --variation 0 --node-number 4 --move-numbers

$(svg_dir)/liberties.forcing-moves.bamboo.wrong.2.svg: $(sgf_dir)/liberties.forcing-moves.bamboo.sgf
$(svg_dir)/liberties.forcing-moves.bamboo.wrong.2.svg: sgf_render_target_options:= --variation 0 --node-number 6 --move-numbers

$(svg_dir)/liberties.forcing-moves.bamboo.wrong.3.svg: $(sgf_dir)/liberties.forcing-moves.bamboo.sgf
$(svg_dir)/liberties.forcing-moves.bamboo.wrong.3.svg: sgf_render_target_options:= --variation 0 --move-numbers

$(svg_dir)/liberties.forcing-moves.bamboo.correct.1.svg: $(sgf_dir)/liberties.forcing-moves.bamboo.sgf
$(svg_dir)/liberties.forcing-moves.bamboo.correct.1.svg: sgf_render_target_options:= --variation 1 --node-number 4 --move-numbers

$(svg_dir)/liberties.forcing-moves.bamboo.correct.2.svg: $(sgf_dir)/liberties.forcing-moves.bamboo.sgf
$(svg_dir)/liberties.forcing-moves.bamboo.correct.2.svg: sgf_render_target_options:= --variation 1 --node-number 5 --move-numbers

$(svg_dir)/liberties.forcing-moves.bamboo.correct.3.svg: $(sgf_dir)/liberties.forcing-moves.bamboo.sgf
$(svg_dir)/liberties.forcing-moves.bamboo.correct.3.svg: sgf_render_target_options:= --variation 1 --move-numbers

$(svg_dir)/liberties.forcing-moves.throw-in.question.svg: $(sgf_dir)/liberties.forcing-moves.throw-in.sgf
$(svg_dir)/liberties.forcing-moves.throw-in.question.svg: sgf_render_target_options:= --variation 0 --node-number 1 --move-numbers

$(svg_dir)/liberties.forcing-moves.throw-in.wrong.1.svg: $(sgf_dir)/liberties.forcing-moves.throw-in.sgf
$(svg_dir)/liberties.forcing-moves.throw-in.wrong.1.svg: sgf_render_target_options:= --variation 2 --node-number 4 --move-numbers

$(svg_dir)/liberties.forcing-moves.throw-in.wrong.2.svg: $(sgf_dir)/liberties.forcing-moves.throw-in.sgf
$(svg_dir)/liberties.forcing-moves.throw-in.wrong.2.svg:	sgf_render_target_options:= --variation 2 --node-number 5 --move-numbers

$(svg_dir)/liberties.forcing-moves.throw-in.wrong.3.svg: $(sgf_dir)/liberties.forcing-moves.throw-in.sgf
$(svg_dir)/liberties.forcing-moves.throw-in.wrong.3.svg: sgf_render_target_options:= --variation 2 --move-numbers

$(svg_dir)/liberties.forcing-moves.throw-in.correct.1.svg: $(sgf_dir)/liberties.forcing-moves.throw-in.sgf
$(svg_dir)/liberties.forcing-moves.throw-in.correct.1.svg: sgf_render_target_options:= --variation 0 --node-number 4 --move-numbers

$(svg_dir)/liberties.forcing-moves.throw-in.correct.2.svg: $(sgf_dir)/liberties.forcing-moves.throw-in.sgf
$(svg_dir)/liberties.forcing-moves.throw-in.correct.2.svg: sgf_render_target_options:= --variation 0 --node-number 5

$(svg_dir)/liberties.forcing-moves.throw-in.correct.3.svg: $(sgf_dir)/liberties.forcing-moves.throw-in.sgf
$(svg_dir)/liberties.forcing-moves.throw-in.correct.3.svg: sgf_render_target_options:= --variation 1 --node-number 5 --move-numbers

$(svg_dir)/liberties.forcing-moves.throw-in.correct.4.svg: $(sgf_dir)/liberties.forcing-moves.throw-in.sgf
$(svg_dir)/liberties.forcing-moves.throw-in.correct.4.svg: sgf_render_target_options:= --variation 1 --move-numbers

$(svg_dir)/liberties.big-eyes.svg: $(sgf_dir)/liberties.big-eyes.sgf
$(svg_dir)/liberties.big-eyes.svg: sgf_render_target_options:= --variation 0 --move-numbers

