{% include "_survey_block_name_check.tpl" %}
<div class="control-group survey-yesno question-{{ nr }}">
    <label class="control-label">{{ blk.prompt }}</label>
{% if blk.explanation %}
     <p class="help-block">{{ blk.explanation|linebreaksbr }}</p>
{% endif %}
    <div class="controls">
{% if blk.input_type == 'submit' %}
        <button class="btn" type="submit" value="1">
            <span></span>{{ blk.yes|default:_"Yes" }}
        </button>
        <button class="btn" type="submit" value="0">
            <span></span>{{ blk.no|default:_"No" }}
        </button>
{% else %}
        <label class="radio inline">
            <input type="radio" id="{{ #yes }}" name="{{ blk.name}}" {% if answers[blk.name] == "yes" %}checked="checked"{% endif %} value="1" /> {{ blk.yes|default:_"Yes" }}
        </label>
        <label class="radio inline">
            <input type="radio" id="{{ #no }}" name="{{ blk.name}}" {% if answers[blk.name] == "no" %}checked="checked"{% endif %} value="0" /> {{ blk.no|default:_"No" }}
        </label>
        {% if blk.is_required %}
            {% validate id=#yes name=blk.name type={presence} %}
        {% endif %}
{% endif %}
    </div>
</div>
